# LibreHardware SoC

LibreHardware SoC is a SoC (System on Chip) that is designed to be used as a base for other SoCs. But it can also be used as a standalone SoC.
We have designed this SoC based around the RISC-V CPU called Ariane. Which was a project of the OpenHWGroup. Made to be a six-stage RISC-V CPU.
A stage is essentially a pipeline stage, where the CPU does different operations in each stage. It means one instruction takes 6 steps to complete.
We are essentially making our own SoC, based around the Ariane CPU, but with our own peripherals and other components. This includes multi-core support,
and advanced features like a branch predictor, cache, and more. To link multiple cores, we use a AXi crossbar switch, or interconnect. We of course want to 
make all cores use the same memory state, so for the Cache Coherence we use a protocol called MESI. 

For the operating system to detect multiple cores, we must configure a Device Tree Blob (DTB), with multiple `cpu` nodes. Each node representing a core.
Each core must have a unique `hartID`, which is a unique identifier for the core. Also called a hart ID, or hardware thread ID. We also need the boot ROM
or the first core to bring up the other cores. Typical SMP boot flow. This is for Linux and Zephyr. For interupt & CLINT / PLIC Sharing, we'll need to use a 
interrupt controller, typically called CLINT or PLIC. CLINT (Core Local Interruptor) is a simple interupt controller that we can use for timers and software
interupts per core. PLIC (Platform Level Interrupt Controller) is a more complex interrupt controller that we will use for external interrupts shared between cores.

Each core will need its own Instruction & Data Cache, as well as its own Interrupt lines. Even though they can share an L2 or main memory. Ariane uses AXI4 for memory 
access, so we'll need to use an AXI crossbar switch to connect all cores to the memory. PULP Platform provides `axi_xbar` module for this purpose. We can also use
open-source NoCs, for example TileLink, Whishbone, oramba noc, or even a custom NoC. Of course we can also use AXI interconnect modules as well.

Below is a small schema with the task, difficulty and description of the tasks needed to build the SoC.
We're using emojis to represent the difficulty of the task. The SoC is a full rewite of the Ariane SoC, also
called CVA6. This Readme is a work in progress, and is not yet complete.

The emojis are as follows:
- 🟢 Easy
- 🟡 Moderate
- 🔴 Hard

| Task                       | Difficulty  | Description              |
| -------------------------- | ----------- | ------------------------ |
| Instantiate multiple cores | 🟢 Easy     | Just duplicate modules   |
| Shared AXI interconnect    | 🟡 Moderate | Use an AXI crossbar      |
| Shared memory (L2 / DRAM)  | 🟡 Moderate | Manage access and timing |
| Cache coherence            | 🔴 Hard     | Needs protocol logic     |
| Interrupt sharing          | 🟡 Moderate | Add CLINT + PLIC         |
| SMP boot support           | 🟡 Moderate | Software/firmware setup  |

This tasklist is not exhaustive, and there are many other tasks that need to be done to create a complete SoC.

<!-- 
## Schematics

![Schematics](schematics.png) -->

## Information
This SoC is a work in progress, and is not yet complete. The current thought is to create this for embedded systems, but it can also be used as a standalone SoC. For example Application Class. Application Class configurations are capable of running Linux. The main supported operating-systems are Linux and Zephyr. In the future we plan to create and maintain our own operating-system, dedicated for this SoC. We plan to use a microkernel, similar to FreeRTOS, but with our own features and capabilities. Even though we're not sure when we'll start working on it, since the main focus is on the SoC itself.

## Side Notes
- We plan to keep using Ariane as the CPU core, but it is possible that we will go for a completly custom CPU core in the future. This is not completely decided yet.
- We plan to use a microkernel, similar to FreeRTOS, but with our own features and capabilities. Even though we're not sure when we'll start working on it, since the main focus is on the SoC itself.
- We plan to use a NoC, similar to TileLink, but with our own features and capabilities. Even though we're not sure when we'll start working on it, since the main focus is on the SoC itself.


## Acknowledgments
- OpenHWGroup - For providing the Ariane CPU Core
- RISC-V Foundation - For providing the RISC-V ISA
- Our Community - For providing support and feedback


## License
This project is licensed under the MIT License - see the LICENSE file for details.
