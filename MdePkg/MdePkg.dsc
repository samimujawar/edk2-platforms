#/** @file
# EFI/PI MdePkg Package
#
# Copyright (c) 2007 - 2009, Intel Corporation<BR>
# Portions copyright (c) 2008-2009 Apple Inc. All rights reserved.<BR>
#
#  All rights reserved. This program and the accompanying materials
#    are licensed and made available under the terms and conditions of the BSD License
#    which accompanies this distribution. The full text of the license may be found at
#    http://opensource.org/licenses/bsd-license.php
#
#    THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
#    WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
#
#**/

[Defines]
  PLATFORM_NAME                  = Mde
  PLATFORM_GUID                  = 082F8BFC-0455-4859-AE3C-ECD64FB81642
  PLATFORM_VERSION               = 1.01
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/Mde
  SUPPORTED_ARCHITECTURES        = IA32|IPF|X64|EBC|ARM
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT

[PcdsFeatureFlag.common]
  gEfiMdePkgTokenSpaceGuid.PcdComponentNameDisable|FALSE
  gEfiMdePkgTokenSpaceGuid.PcdDriverDiagnosticsDisable|FALSE
  gEfiMdePkgTokenSpaceGuid.PcdComponentName2Disable|FALSE
  gEfiMdePkgTokenSpaceGuid.PcdDriverDiagnostics2Disable|FALSE
  gEfiMdePkgTokenSpaceGuid.PcdUgaConsumeSupport|TRUE

[PcdsFixedAtBuild.common]
  gEfiMdePkgTokenSpaceGuid.PcdMaximumUnicodeStringLength|1000000
  gEfiMdePkgTokenSpaceGuid.PcdMaximumAsciiStringLength|1000000
  gEfiMdePkgTokenSpaceGuid.PcdMaximumLinkedListLength|1000000
  gEfiMdePkgTokenSpaceGuid.PcdSpinLockTimeout|10000000
  gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0x0f
  gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x80000000
  gEfiMdePkgTokenSpaceGuid.PcdReportStatusCodePropertyMask|0x06
  gEfiMdePkgTokenSpaceGuid.PcdDebugClearMemoryValue|0xAF
  gEfiMdePkgTokenSpaceGuid.PcdPerformanceLibraryPropertyMask|0
  gEfiMdePkgTokenSpaceGuid.PcdPostCodePropertyMask|0
  gEfiMdePkgTokenSpaceGuid.PcdPciExpressBaseAddress|0xE0000000
  gEfiMdePkgTokenSpaceGuid.PcdFSBClock|200000000
  gEfiMdePkgTokenSpaceGuid.PcdUefiLibMaxPrintBufferSize|320
  gEfiMdePkgTokenSpaceGuid.PcdMaximumGuidedExtractHandler|0x10
  gEfiMdePkgTokenSpaceGuid.PcdUsbTransferTimeoutValue|3000

[PcdsFixedAtBuild.IPF]
  gEfiMdePkgTokenSpaceGuid.PcdIoBlockBaseAddressForIpf|0x0ffffc000000

###################################################################################################
#
# Components Section - list of the modules and components that will be processed by compilation
#                      tools and the EDK II tools to generate PE32/PE32+/Coff image files.
#
# Note: The EDK II DSC file is not used to specify how compiled binary images get placed
#       into firmware volume images. This section is just a list of modules to compile from
#       source into UEFI-compliant binaries.
#       It is the FDF file that contains information on combining binary files into firmware
#       volume images, whose concept is beyond UEFI and is described in PI specification.
#       Binary modules do not need to be listed in this section, as they should be
#       specified in the FDF file. For example: Shell binary (Shell_Full.efi), FAT binary (Fat.efi),
#       Logo (Logo.bmp), and etc.
#       There may also be modules listed in this section that are not required in the FDF file,
#       When a module listed here is excluded from FDF file, then UEFI-compliant binary will be
#       generated for it, but the binary will not be put into any firmware volume.
#
###################################################################################################

[Components.common]
  MdePkg/Library/BaseCacheMaintenanceLib/BaseCacheMaintenanceLib.inf
  MdePkg/Library/BaseCpuLib/BaseCpuLib.inf
  MdePkg/Library/BaseDebugLibNull/BaseDebugLibNull.inf
  MdePkg/Library/BaseDebugLibSerialPort/BaseDebugLibSerialPort.inf
  MdePkg/Library/BaseLib/BaseLib.inf
  MdePkg/Library/BaseMemoryLib/BaseMemoryLib.inf
  MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
  MdePkg/Library/BasePciCf8Lib/BasePciCf8Lib.inf
  MdePkg/Library/BasePciExpressLib/BasePciExpressLib.inf
  MdePkg/Library/BasePciLibCf8/BasePciLibCf8.inf
  MdePkg/Library/BasePciLibPciExpress/BasePciLibPciExpress.inf
  MdePkg/Library/BasePeCoffGetEntryPointLib/BasePeCoffGetEntryPointLib.inf
  MdePkg/Library/BasePeCoffLib/BasePeCoffLib.inf
  MdePkg/Library/BasePeCoffExtraActionLibNull/BasePeCoffExtraActionLibNull.inf
  MdePkg/Library/BasePerformanceLibNull/BasePerformanceLibNull.inf
  MdePkg/Library/BasePostCodeLibDebug/BasePostCodeLibDebug.inf
  MdePkg/Library/BasePostCodeLibPort80/BasePostCodeLibPort80.inf
  MdePkg/Library/BasePrintLib/BasePrintLib.inf
  MdePkg/Library/BaseReportStatusCodeLibNull/BaseReportStatusCodeLibNull.inf
  MdePkg/Library/BaseSerialPortLibNull/BaseSerialPortLibNull.inf
  MdePkg/Library/BaseSynchronizationLib/BaseSynchronizationLib.inf
  MdePkg/Library/BaseTimerLibNullTemplate/BaseTimerLibNullTemplate.inf
  MdePkg/Library/BaseUefiDecompressLib/BaseUefiDecompressLib.inf

  MdePkg/Library/DxeCoreEntryPoint/DxeCoreEntryPoint.inf
  MdePkg/Library/DxeCoreHobLib/DxeCoreHobLib.inf
  MdePkg/Library/DxeExtractGuidedSectionLib/DxeExtractGuidedSectionLib.inf
  MdePkg/Library/DxeHobLib/DxeHobLib.inf
  MdePkg/Library/DxePcdLib/DxePcdLib.inf
  MdePkg/Library/DxeServicesLib/DxeServicesLib.inf
  MdePkg/Library/DxeServicesTableLib/DxeServicesTableLib.inf
  MdePkg/Library/DxeSmbusLib/DxeSmbusLib.inf

  MdePkg/Library/DxeRuntimePciExpressLib/DxeRuntimePciExpressLib.inf

  MdePkg/Library/PeiCoreEntryPoint/PeiCoreEntryPoint.inf
  MdePkg/Library/PeiDxePostCodeLibReportStatusCode/PeiDxePostCodeLibReportStatusCode.inf
  MdePkg/Library/PeiExtractGuidedSectionLib/PeiExtractGuidedSectionLib.inf
  MdePkg/Library/PeiHobLib/PeiHobLib.inf
  MdePkg/Library/PeiIoLibCpuIo/PeiIoLibCpuIo.inf
  MdePkg/Library/PeiMemoryAllocationLib/PeiMemoryAllocationLib.inf
  MdePkg/Library/PeiMemoryLib/PeiMemoryLib.inf
  MdePkg/Library/PeimEntryPoint/PeimEntryPoint.inf
  MdePkg/Library/PeiPcdLib/PeiPcdLib.inf
  MdePkg/Library/PeiResourcePublicationLib/PeiResourcePublicationLib.inf
  MdePkg/Library/PeiServicesLib/PeiServicesLib.inf
  MdePkg/Library/PeiServicesTablePointerLib/PeiServicesTablePointerLib.inf
  MdePkg/Library/PeiSmbusLibSmbus2Ppi/PeiSmbusLibSmbus2Ppi.inf
  MdePkg/Library/PeiPciLibPciCfg2/PeiPciLibPciCfg2.inf
  MdePkg/Library/PeiPciSegmentLibPciCfg2/PeiPciSegmentLibPciCfg2.inf

  MdePkg/Library/UefiApplicationEntryPoint/UefiApplicationEntryPoint.inf
  MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  MdePkg/Library/UefiDebugLibConOut/UefiDebugLibConOut.inf
  MdePkg/Library/UefiDebugLibStdErr/UefiDebugLibStdErr.inf
  MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  MdePkg/Library/UefiDevicePathLibDevicePathProtocol/UefiDevicePathLibDevicePathProtocol.inf
  MdePkg/Library/UefiDriverEntryPoint/UefiDriverEntryPoint.inf
  MdePkg/Library/UefiLib/UefiLib.inf
  MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
  MdePkg/Library/UefiMemoryLib/UefiMemoryLib.inf
  MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf
  MdePkg/Library/UefiScsiLib/UefiScsiLib.inf
  MdePkg/Library/UefiUsbLib/UefiUsbLib.inf
  MdePkg/Library/UefiPciLibPciRootBridgeIo/UefiPciLibPciRootBridgeIo.inf
  MdePkg/Library/UefiPciSegmentLibPciRootBridgeIo/UefiPciSegmentLibPciRootBridgeIo.inf

[Components.IA32, Components.X64]
  MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
  MdePkg/Library/BaseMemoryLibMmx/BaseMemoryLibMmx.inf
  MdePkg/Library/BaseMemoryLibOptDxe/BaseMemoryLibOptDxe.inf
  MdePkg/Library/BaseMemoryLibOptPei/BaseMemoryLibOptPei.inf
  MdePkg/Library/BaseMemoryLibRepStr/BaseMemoryLibRepStr.inf
  MdePkg/Library/BaseMemoryLibSse2/BaseMemoryLibSse2.inf
  MdePkg/Library/PeiServicesTablePointerLibIdt/PeiServicesTablePointerLibIdt.inf
  MdePkg/Library/SecPeiDxeTimerLibCpu/SecPeiDxeTimerLibCpu.inf
  MdePkg/Library/UefiRuntimeLib/UefiRuntimeLib.inf
  MdePkg/Library/SmmIoLibSmmCpuIo2/SmmIoLibSmmCpuIo2.inf
  MdePkg/Library/SmmPciLibPciRootBridgeIo/SmmPciLibPciRootBridgeIo.inf
  MdePkg/Library/SmmServicesTableLib/SmmServicesTableLib.inf

[Components.IPF]
  MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
  MdePkg/Library/BasePalLibNull/BasePalLibNull.inf
  MdePkg/Library/PeiPalLib/PeiPalLib.inf
  MdePkg/Library/PeiServicesTablePointerLibKr7/PeiServicesTablePointerLibKr7.inf
  MdePkg/Library/SecPeiDxeTimerLibCpu/SecPeiDxeTimerLibCpu.inf
  MdePkg/Library/UefiPalLib/UefiPalLib.inf
  MdePkg/Library/UefiSalLib/UefiSalLib.inf


[Components.EBC]
  MdePkg/Library/UefiRuntimeLib/UefiRuntimeLib.inf

