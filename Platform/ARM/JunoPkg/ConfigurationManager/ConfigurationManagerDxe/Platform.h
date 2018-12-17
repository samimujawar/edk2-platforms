/** @file

  Copyright (c) 2017 - 2019, ARM Limited. All rights reserved.

  This program and the accompanying materials
  are licensed and made available under the terms and conditions of the BSD License
  which accompanies this distribution.  The full text of the license may be found at
  http://opensource.org/licenses/bsd-license.php

  THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
  WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.

**/

#ifndef PLATFORM_H__
#define PLATFORM_H__

#define ENABLE_MEM_MAPPED_TIMER

#ifdef ENABLE_MEM_MAPPED_TIMER
// REFCLK CNTControl
#define JUNO_SYSTEM_TIMER_BASE_ADDRESS   0x2A430000
// REFCLK CNTRead
#define JUNO_CNT_READ_BASE_ADDRESS       0x2A800000
#else
#define JUNO_SYSTEM_TIMER_BASE_ADDRESS   0xFFFFFFFFFFFFFFFF
#define JUNO_CNT_READ_BASE_ADDRESS       0xFFFFFFFFFFFFFFFF
#endif

// GT Block Timer
// AP_REFCLK CNTCTL
#define JUNO_GT_BLOCK_CTL_BASE           0x2A810000
#define JUNO_TIMER_FRAMES_COUNT          2

// GT Block Timer Frames
// AP_REFCLK_S CNTBase0
#define JUNO_GT_BLOCK_FRAME0_CTL_BASE      0x2A820000
#define JUNO_GT_BLOCK_FRAME0_CTL_EL0_BASE  0xFFFFFFFFFFFFFFFF
#define JUNO_GT_BLOCK_FRAME0_GSIV          91

// AP_REFCLK_NS CNTBase1
#define JUNO_GT_BLOCK_FRAME1_CTL_BASE      0x2A830000
#define JUNO_GT_BLOCK_FRAME1_CTL_EL0_BASE  0xFFFFFFFFFFFFFFFF
#define JUNO_GT_BLOCK_FRAME1_GSIV          92

#define GTDT_TIMER_EDGE_TRIGGERED   \
          EFI_ACPI_6_2_GTDT_TIMER_FLAG_TIMER_INTERRUPT_MODE
#define GTDT_TIMER_LEVEL_TRIGGERED  0
#define GTDT_TIMER_ACTIVE_LOW       \
          EFI_ACPI_6_2_GTDT_TIMER_FLAG_TIMER_INTERRUPT_POLARITY
#define GTDT_TIMER_ACTIVE_HIGH      0
#define GTDT_TIMER_SAVE_CONTEXT     \
          EFI_ACPI_6_2_GTDT_TIMER_FLAG_ALWAYS_ON_CAPABILITY
#define GTDT_TIMER_LOSE_CONTEXT     0

#define JUNO_GTDT_GTIMER_FLAGS      (GTDT_TIMER_LOSE_CONTEXT   | \
                                       GTDT_TIMER_ACTIVE_LOW   | \
                                       GTDT_TIMER_LEVEL_TRIGGERED)

// GT Block Timer Flags
#define GTX_TIMER_EDGE_TRIGGERED    \
          EFI_ACPI_6_2_GTDT_GT_BLOCK_TIMER_FLAG_TIMER_INTERRUPT_MODE
#define GTX_TIMER_LEVEL_TRIGGERED   0
#define GTX_TIMER_ACTIVE_LOW        \
          EFI_ACPI_6_2_GTDT_GT_BLOCK_TIMER_FLAG_TIMER_INTERRUPT_POLARITY
#define GTX_TIMER_ACTIVE_HIGH       0

#define JUNO_GTX_TIMER_FLAGS         (GTX_TIMER_ACTIVE_HIGH | \
                                        GTX_TIMER_LEVEL_TRIGGERED)

#define GTX_TIMER_SECURE            \
          EFI_ACPI_6_2_GTDT_GT_BLOCK_COMMON_FLAG_SECURE_TIMER
#define GTX_TIMER_NON_SECURE        0
#define GTX_TIMER_SAVE_CONTEXT      \
          EFI_ACPI_6_2_GTDT_GT_BLOCK_COMMON_FLAG_ALWAYS_ON_CAPABILITY
#define GTX_TIMER_LOSE_CONTEXT      0

#define JUNO_GTX_COMMON_FLAGS_S      (GTX_TIMER_SAVE_CONTEXT      | \
                                        GTX_TIMER_SECURE)
#define JUNO_GTX_COMMON_FLAGS_NS     (GTX_TIMER_SAVE_CONTEXT      | \
                                        GTX_TIMER_NON_SECURE)

// Watchdog
#define SBSA_WATCHDOG_EDGE_TRIGGERED   \
          EFI_ACPI_6_2_GTDT_SBSA_GENERIC_WATCHDOG_FLAG_TIMER_INTERRUPT_MODE
#define SBSA_WATCHDOG_LEVEL_TRIGGERED  0
#define SBSA_WATCHDOG_ACTIVE_LOW       \
          EFI_ACPI_6_2_GTDT_SBSA_GENERIC_WATCHDOG_FLAG_TIMER_INTERRUPT_POLARITY
#define SBSA_WATCHDOG_ACTIVE_HIGH      0
#define SBSA_WATCHDOG_SECURE           \
          EFI_ACPI_6_2_GTDT_SBSA_GENERIC_WATCHDOG_FLAG_SECURE_TIMER
#define SBSA_WATCHDOG_NON_SECURE       0

#define JUNO_SBSA_WATCHDOG_FLAGS       (SBSA_WATCHDOG_NON_SECURE    | \
                                          SBSA_WATCHDOG_ACTIVE_HIGH | \
                                          SBSA_WATCHDOG_EDGE_TRIGGERED)

#endif // PLATFORM_H__

