/** @file
  SSDT Template for CPU

  Copyright (c) 2018, ARM Ltd. All rights reserved.<BR>
    This program and the accompanying materials
  are licensed and made available under the terms and conditions of the BSD License
  which accompanies this distribution.  The full text of the license may be found at
  http://opensource.org/licenses/bsd-license.php

  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

**/

DefinitionBlock("SsdtCpu.aml", "SSDT", 1, "ARMLTD", "ARM-VEXP", 1) {
  Scope(_SB) {
    //
    // Processor
    //
    Device(CP5A) {
      Name(_HID, "ACPI0007")
      Name(_UID, 0xA5)
    }
  }
}
