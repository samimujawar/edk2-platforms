/** @file
  Differentiated System Description Table Fields (DSDT)

  Copyright (c) 2014-2018, ARM Ltd. All rights reserved.<BR>
    This program and the accompanying materials
  are licensed and made available under the terms and conditions of the BSD License
  which accompanies this distribution.  The full text of the license may be found at
  http://opensource.org/licenses/bsd-license.php

  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

**/

DefinitionBlock("DsdtTable.aml", "DSDT", 1, "ARMLTD", "ARM-VEXP", 1) {
  Scope(_SB) {
    // Processor information is provided through dynamically generated
    // SSDTs for the CPUs

    // UART PL011
    Device(COM2) {
      Name(_HID, "ARMH0011")
      Name(_CID, "PL011")
      Name(_UID, Zero)

      Method(_STA) {
        Return(0xF)
      }

      Method(_CRS, 0x0, NotSerialized) {
        Name(RBUF, ResourceTemplate() {
          Memory32Fixed(ReadWrite, 0x1c090000, 0x1000)
          Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive) { 0x25 }
        })
        Return (RBUF)
      }
    }

  } // Scope(_SB)
}
