#
#  Copyright (c) 2013-2017, ARM Limited. All rights reserved.
#
#  This program and the accompanying materials
#  are licensed and made available under the terms and conditions of the BSD License
#  which accompanies this distribution.  The full text of the license may be found at
#  http://opensource.org/licenses/bsd-license.php
#
#  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
#  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
#

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = ArmJuno
  PLATFORM_GUID                  = ca0722fd-7d3d-45ea-948c-d62b2199807d
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
!ifdef EDK2_OUT_DIR
  OUTPUT_DIRECTORY               = $(EDK2_OUT_DIR)
!else
  OUTPUT_DIRECTORY               = Build/ArmJuno
!endif
  SUPPORTED_ARCHITECTURES        = AARCH64|ARM
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = Platform/ARM/JunoPkg/ArmJuno.fdf

# On RTSM, most peripherals are VExpress Motherboard peripherals
!include Platform/ARM/VExpressPkg/ArmVExpress.dsc.inc

[LibraryClasses.common]
  ArmLib|ArmPkg/Library/ArmLib/ArmBaseLib.inf
  ArmMmuLib|ArmPkg/Library/ArmMmuLib/ArmMmuBaseLib.inf
  ArmPlatformLib|Platform/ARM/JunoPkg/Library/ArmJunoLib/ArmJunoLib.inf
  ArmSmcLib|ArmPkg/Library/ArmSmcLib/ArmSmcLib.inf

  NorFlashPlatformLib|Platform/ARM/JunoPkg/Library/NorFlashJunoLib/NorFlashJunoLib.inf

  CapsuleLib|MdeModulePkg/Library/DxeCapsuleLibNull/DxeCapsuleLibNull.inf
  CustomizedDisplayLib|MdeModulePkg/Library/CustomizedDisplayLib/CustomizedDisplayLib.inf

  # USB Requirements
  UefiUsbLib|MdePkg/Library/UefiUsbLib/UefiUsbLib.inf

[LibraryClasses.common.SEC]
  PrePiLib|EmbeddedPkg/Library/PrePiLib/PrePiLib.inf
  ExtractGuidedSectionLib|EmbeddedPkg/Library/PrePiExtractGuidedSectionLib/PrePiExtractGuidedSectionLib.inf
  LzmaDecompressLib|MdeModulePkg/Library/LzmaCustomDecompressLib/LzmaCustomDecompressLib.inf
  MemoryAllocationLib|EmbeddedPkg/Library/PrePiMemoryAllocationLib/PrePiMemoryAllocationLib.inf
  HobLib|EmbeddedPkg/Library/PrePiHobLib/PrePiHobLib.inf
  PrePiHobListPointerLib|ArmPlatformPkg/Library/PrePiHobListPointerLib/PrePiHobListPointerLib.inf
  PerformanceLib|MdeModulePkg/Library/PeiPerformanceLib/PeiPerformanceLib.inf
  PlatformPeiLib|ArmPlatformPkg/PlatformPei/PlatformPeiLib.inf

[LibraryClasses.common.SEC, LibraryClasses.common.PEIM]
  MemoryInitPeiLib|ArmPlatformPkg/MemoryInitPei/MemoryInitPeiLib.inf

[LibraryClasses.common.UEFI_DRIVER, LibraryClasses.common.UEFI_APPLICATION, LibraryClasses.common.DXE_RUNTIME_DRIVER, LibraryClasses.common.DXE_DRIVER]
  PcdLib|MdePkg/Library/DxePcdLib/DxePcdLib.inf
  NonDiscoverableDeviceRegistrationLib|MdeModulePkg/Library/NonDiscoverableDeviceRegistrationLib/NonDiscoverableDeviceRegistrationLib.inf
  PciHostBridgeLib|Platform/ARM/JunoPkg/Library/JunoPciHostBridgeLib/JunoPciHostBridgeLib.inf
  PciSegmentLib|MdePkg/Library/BasePciSegmentLibPci/BasePciSegmentLibPci.inf
  PciLib|MdePkg/Library/BasePciLibPciExpress/BasePciLibPciExpress.inf
  PciExpressLib|MdePkg/Library/BasePciExpressLib/BasePciExpressLib.inf

[BuildOptions]
  GCC:*_*_ARM_PLATFORM_FLAGS = -march=armv8-a

################################################################################
#
# Pcd Section - list of all EDK II PCD Entries defined by this Platform
#
################################################################################

[PcdsFeatureFlag.common]
  ## If TRUE, Graphics Output Protocol will be installed on virtual handle created by ConsplitterDxe.
  #  It could be set FALSE to save size.
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutGopSupport|TRUE

  gEfiMdeModulePkgTokenSpaceGuid.PcdTurnOffUsbLegacySupport|TRUE

[PcdsFixedAtBuild.common]
  #
  # NV Storage PCDs. Use base of 0x08000000 for NOR0
  #
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase|0x0BFC0000
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableSize|0x00010000
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingBase|0x0BFD0000
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingSize|0x00010000
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareBase|0x0BFE0000
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareSize|0x00010000

  # System Memory (2GB - 16MB of Trusted DRAM at the top of the 32bit address space)
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x7F000000

  # Juno Dual-Cluster profile
  gArmPlatformTokenSpaceGuid.PcdCoreCount|6
  gArmPlatformTokenSpaceGuid.PcdClusterCount|2

  gArmTokenSpaceGuid.PcdVFPEnabled|1

  #
  # ARM PrimeCell
  #

  ## PL011 - Serial Terminal
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialRegisterBase|0x7FF80000
  gEfiMdePkgTokenSpaceGuid.PcdUartDefaultReceiveFifoDepth|0
  gArmPlatformTokenSpaceGuid.PL011UartClkInHz|7372800
  gArmPlatformTokenSpaceGuid.PL011UartInterrupt|115

  ## PL011 - Serial Debug UART
  gArmPlatformTokenSpaceGuid.PcdSerialDbgRegisterBase|0x7FF80000
  gArmPlatformTokenSpaceGuid.PcdSerialDbgUartClkInHz|7372800
  gArmPlatformTokenSpaceGuid.PcdSerialDbgUartBaudRate|115200

  ## PL031 RealTimeClock
  gArmPlatformTokenSpaceGuid.PcdPL031RtcBase|0x1C170000

  ## SBSA Watchdog Count
!ifndef DISABLE_SBSA_WATCHDOG
  gArmPlatformTokenSpaceGuid.PcdWatchdogCount|2
!endif

  # LAN9118 Ethernet Driver
  gEmbeddedTokenSpaceGuid.PcdLan9118DxeBaseAddress|0x18000000
  gEmbeddedTokenSpaceGuid.PcdLan9118DefaultMacAddress|0x1215161822242628
  gEmbeddedTokenSpaceGuid.PcdLan9118DefaultNegotiationTimeout|40000

  #
  # ARM General Interrupt Controller
  #
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x2C010000
  gArmTokenSpaceGuid.PcdGicInterruptInterfaceBase|0x2C02F000

  #
  # PLDA PCI Root Complex
  #
  gArmTokenSpaceGuid.PcdPciBusMax|255
  gArmTokenSpaceGuid.PcdPciIoBase|0x0
  gArmTokenSpaceGuid.PcdPciIoSize|0x00800000
  gArmTokenSpaceGuid.PcdPciMmio32Base|0x50000000
  gArmTokenSpaceGuid.PcdPciMmio32Size|0x08000000
  gArmTokenSpaceGuid.PcdPciMmio64Base|0x4000000000
  gArmTokenSpaceGuid.PcdPciMmio64Size|0x100000000

  gEfiMdePkgTokenSpaceGuid.PcdPciExpressBaseAddress|0x40000000
  gArmTokenSpaceGuid.PcdPciIoTranslation|0x5f800000
  gEmbeddedTokenSpaceGuid.PcdPrePiCpuIoSize|24

  # List of Device Paths that support BootMonFs
  gArmBootMonFsTokenSpaceGuid.PcdBootMonFsSupportedDevicePaths|L"VenHw(E7223039-5836-41E1-B542-D7EC736C5E59)"

  #
  # ARM Architectural Timer Frequency
  #
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|50000000
  gEmbeddedTokenSpaceGuid.PcdMetronomeTickPeriod|1000

  gEfiMdeModulePkgTokenSpaceGuid.PcdResetOnMemoryTypeInformationChange|FALSE

  #
  # SMBIOS entry point version
  #
  gEfiMdeModulePkgTokenSpaceGuid.PcdSmbiosVersion|0x0300
  gEfiMdeModulePkgTokenSpaceGuid.PcdSmbiosDocRev|0x0
  #
  # ACPI Table Version
  #
  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiExposedTableVersions|0x20

[PcdsPatchableInModule]
  # Console Resolution (Full HD)
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|1920
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|1080

[PcdsDynamicDefault.common]
  #
  # The size of a dynamic PCD of the (VOID*) type can not be increased at run
  # time from its size at build time. Set the "PcdFdtDevicePaths" PCD to a 128
  # character "empty" string, to allow to be able to set FDT text device paths
  # up to 128 characters long.
  #
  gFdtPlatformDxeTokenSpaceGuid.PcdFdtDevicePaths|L"                                                                                                                                "

  # Not all Juno platforms support PCI. This dynamic PCD disables or enable
  # PCI support.
  gEfiMdeModulePkgTokenSpaceGuid.PcdPciDisableBusEnumeration|TRUE

################################################################################
#
# Components Section - list of all EDK II Modules needed by this Platform
#
################################################################################
[Components.common]
  #
  # PEI Phase modules
  #
  ArmPlatformPkg/PrePi/PeiUniCore.inf

  #
  # DXE
  #
  MdeModulePkg/Core/Dxe/DxeMain.inf {
    <LibraryClasses>
      PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
      NULL|MdeModulePkg/Library/DxeCrc32GuidedSectionExtractLib/DxeCrc32GuidedSectionExtractLib.inf
  }

  #
  # Architectural Protocols
  #
  ArmPkg/Drivers/CpuDxe/CpuDxe.inf
  MdeModulePkg/Core/RuntimeDxe/RuntimeDxe.inf
  MdeModulePkg/Universal/SecurityStubDxe/SecurityStubDxe.inf
  MdeModulePkg/Universal/CapsuleRuntimeDxe/CapsuleRuntimeDxe.inf
  MdeModulePkg/Universal/MonotonicCounterRuntimeDxe/MonotonicCounterRuntimeDxe.inf
  MdeModulePkg/Universal/ResetSystemRuntimeDxe/ResetSystemRuntimeDxe.inf
  EmbeddedPkg/RealTimeClockRuntimeDxe/RealTimeClockRuntimeDxe.inf
  EmbeddedPkg/MetronomeDxe/MetronomeDxe.inf

  MdeModulePkg/Universal/Console/ConPlatformDxe/ConPlatformDxe.inf
  MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitterDxe.inf
  MdeModulePkg/Universal/Console/GraphicsConsoleDxe/GraphicsConsoleDxe.inf
  MdeModulePkg/Universal/Console/TerminalDxe/TerminalDxe.inf
  MdeModulePkg/Universal/SerialDxe/SerialDxe.inf

  MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf {
    <LibraryClasses>
      NULL|MdeModulePkg/Library/VarCheckUefiLib/VarCheckUefiLib.inf
      BaseMemoryLib|MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
  }
  MdeModulePkg/Universal/FaultTolerantWriteDxe/FaultTolerantWriteDxe.inf

  #
  # ACPI Support
  #
  MdeModulePkg/Universal/Acpi/AcpiTableDxe/AcpiTableDxe.inf
  Platform/ARM/JunoPkg/AcpiTables/AcpiTables.inf

  MdeModulePkg/Universal/HiiDatabaseDxe/HiiDatabaseDxe.inf

  ArmPkg/Drivers/ArmGic/ArmGicDxe.inf
  ArmPlatformPkg/Drivers/NorFlashDxe/NorFlashDxe.inf
  ArmPkg/Drivers/TimerDxe/TimerDxe.inf
  ArmPkg/Drivers/GenericWatchdogDxe/GenericWatchdogDxe.inf

  #
  # Firmware Performance Data Table (FPDT)
  #
  MdeModulePkg/Universal/ReportStatusCodeRouter/RuntimeDxe/ReportStatusCodeRouterRuntimeDxe.inf
  MdeModulePkg/Universal/Acpi/FirmwarePerformanceDataTableDxe/FirmwarePerformanceDxe.inf {
    <LibraryClasses>
      LockBoxLib|MdeModulePkg/Library/LockBoxNullLib/LockBoxNullLib.inf
  }

  #
  # Semi-hosting filesystem
  #
  ArmPkg/Filesystem/SemihostFs/SemihostFs.inf

  #
  # FAT filesystem + GPT/MBR partitioning
  #
  MdeModulePkg/Universal/Disk/DiskIoDxe/DiskIoDxe.inf
  MdeModulePkg/Universal/Disk/PartitionDxe/PartitionDxe.inf
  MdeModulePkg/Universal/Disk/UnicodeCollation/EnglishDxe/EnglishDxe.inf

  # Required by PCI
  ArmPkg/Drivers/ArmPciCpuIo2Dxe/ArmPciCpuIo2Dxe.inf

  #
  # PCI Support
  #
  MdeModulePkg/Bus/Pci/PciBusDxe/PciBusDxe.inf
  MdeModulePkg/Bus/Pci/PciHostBridgeDxe/PciHostBridgeDxe.inf

  #
  # SATA Controller
  #
  MdeModulePkg/Bus/Ata/AtaBusDxe/AtaBusDxe.inf
  EmbeddedPkg/Drivers/SataSiI3132Dxe/SataSiI3132Dxe.inf

  #
  # NVMe boot devices
  #
  MdeModulePkg/Bus/Pci/NvmExpressDxe/NvmExpressDxe.inf

  #
  # Networking stack
  #
  EmbeddedPkg/Drivers/Lan9118Dxe/Lan9118Dxe.inf
!if 0
  OptionRomPkg/MarvellYukonDxe/MarvellYukonDxe.inf
!endif

  #
  # Usb Support
  #
  MdeModulePkg/Bus/Pci/UhciDxe/UhciDxe.inf
  MdeModulePkg/Bus/Pci/EhciDxe/EhciDxe.inf
  MdeModulePkg/Bus/Pci/XhciDxe/XhciDxe.inf
  MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBusDxe.inf
  MdeModulePkg/Bus/Usb/UsbKbDxe/UsbKbDxe.inf
  MdeModulePkg/Bus/Usb/UsbMouseDxe/UsbMouseDxe.inf
  MdeModulePkg/Bus/Usb/UsbMassStorageDxe/UsbMassStorageDxe.inf
  MdeModulePkg/Bus/Pci/NonDiscoverablePciDeviceDxe/NonDiscoverablePciDeviceDxe.inf

  #
  # Juno platform driver
  #
  Platform/ARM/JunoPkg/Drivers/ArmJunoDxe/ArmJunoDxe.inf

  #
  # SMBIOS/DMI
  #
  MdeModulePkg/Universal/SmbiosDxe/SmbiosDxe.inf
  Platform/ARM/JunoPkg/SmbiosPlatformDxe/SmbiosPlatformDxe.inf

  #
  # Bds
  #
  MdeModulePkg/Universal/DevicePathDxe/DevicePathDxe.inf
  MdeModulePkg/Universal/DisplayEngineDxe/DisplayEngineDxe.inf
  MdeModulePkg/Universal/SetupBrowserDxe/SetupBrowserDxe.inf
  MdeModulePkg/Universal/BdsDxe/BdsDxe.inf
  MdeModulePkg/Application/UiApp/UiApp.inf {
    <LibraryClasses>
      NULL|MdeModulePkg/Library/DeviceManagerUiLib/DeviceManagerUiLib.inf
      NULL|MdeModulePkg/Library/BootManagerUiLib/BootManagerUiLib.inf
      NULL|MdeModulePkg/Library/BootMaintenanceManagerUiLib/BootMaintenanceManagerUiLib.inf
  }

  #
  # FDT installation
  #
  Platform/ARM/Drivers/FdtPlatformDxe/FdtPlatformDxe.inf {
    <LibraryClasses>
      BdsLib|Platform/ARM/Library/BdsLib/BdsLib.inf
  }

[Components.AARCH64]
  #
  # EBC
  #
  MdeModulePkg/Universal/EbcDxe/EbcDxe.inf
