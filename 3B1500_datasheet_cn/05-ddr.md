DDR2/3 SDRAM Controller Interface Description
The Loongson 3B1500 integrates a memory controller that is compatible with the DDR2/3 SDRAM standards.

DDR2/3 SDRAM Controller Features
The Loongson 3B1500 processor has two memory controllers, each capable of supporting two memory modules, with a total of four chip select signals. By utilizing four chip select signals and a 19-bit address bus (16 bits for row/column addresses and 3 bits for logical Bank addresses), the maximum address space is 128G (2^37).

Before using DDR2/3 SDRAM, it is necessary to configure the parameters of the DDR2/3 controller to work correctly with the corresponding memory modules. For the Loongson 3B1500 processor, the maximum number of chip select signals (CS_n) is 4. The maximum bandwidth for row address (RAS_n) and column address (CAS_n) is 15 and 14, respectively. There are also 3 bits for logical bank signals (BANK_n).

The physical address of the CPU's memory can be translated into row/column addresses, as shown in Table 5-1. For example, with 4 CS_n signals, 8 banks, 12 bits for row addresses, and 12 bits for column addresses.

Table 5-1 Clock Signal DDR2 SDRAM Row/Column Address Translation
36 32 31 30 29 18 17 15 14 3 2 0
CS_n RAS_n BANK_n CAS_n Byte

The memory controller receives memory read/write requests sent from the processor or external devices.

The memory controller implements dynamic page management functionality. For a single access to memory, without the intervention of software designers, the controller will select the Open Page/Close Page strategy in hardware circuits. The features of the memory controller include:

Supported memory types include: DDR2/3 chips, DDR2/3 UDIMM, DDR2/3 SO-DIMM, DDR2/3 RDIMM;
Fully pipelined command and data read/write operations;
Increased bandwidth through merging and reordering;
Basic parameters can be modified through rich register read/write ports;
Built-in Delay Compensation Circuit (DCC) for reliable data transmission/reception;
1-bit and 2-bit error detection, 1-bit error correction through ECC;
Frequency: 400MHz-667MHz;
Selectable bus widths of 16/32/64 bits.
DDR2/3 SDRAM Read Protocol
Figure 5-1 illustrates the DDR2 SDRAM read protocol, where the commands (CMD) include RAS_n, CAS_n, and WE_n. When a read request occurs, RAS_n=1, CAS_n=0, WE_n=1.

Figure 5-1 DDR2 SDRAM Read Protocol
Note: Cas Latency = 3, Read Latency = 3, Burst Length = 8

DDR2/3 SDRAM Write Protocol
Figure 5-2 shows the DDR2 SDRAM write protocol, where the commands (CMD) include RAS_n, CAS_n, and WE_n. When a write request occurs, RAS_n=1, CAS_n=0, WE_n=0. Unlike the read protocol, DQM is used to identify the number of bytes to be written. DQM and DQS are synchronous.

Figure 5-2 DDR2 SDRAM Write Protocol
Note: Cas Latency = 3, Write Latency = Read Latency - 1 = 2, Burst Length = 4.

DDR2/3 SDRAM Parameter Setting Sequence
To support different DDR2/3 SDRAM chips in the system, DDR2/3 SDRAM needs to be configured after power-on reset. Detailed configuration operations and procedures are defined in the DDR2/3 standards. DDR2/3 is not available before memory initialization. The initialization operation starts when software writes 1 to the Init_start register (0x018). Before setting the Init_start signal, all other registers must be set to the correct values. The software-hardware coordinated DRAM initialization process is as follows:

Software writes correct configuration values to all registers, but Init_start (0x018) must remain 0 during this process.
Software sets Init_start (0x018) to 1, which triggers the start of hardware initialization.
The internal PHY starts the initialization operation, and the DLL attempts to perform a locking operation. If the locking is successful, the corresponding status can be read from Dll_init_done (0x000), and the current number of locked delay lines can be read/written from Dll_value_ck (0x000). If the locking fails, the initialization will not continue (it can be continued by setting Dll_bypass (0x018)).
After DLL locking (or bypass setting), the controller will send the corresponding initialization sequence to the DRAM based on the initialization requirements of the corresponding DRAM, such as MRS commands, ZQCL commands, etc.
Software can sample the Dram_init (0x160) register to determine if the memory initialization operation is completed.
Fine-Grained Multi-Channel Mode
The Loongson 3B1500 supports a memory access mode called Fine-Grained Multi-Channel, which effectively increases memory bandwidth utilization and reduces memory power consumption.

To use the Fine-Grained Multi-Channel mode, each CS/ODT is connected to 16-bit DQ during hardware connection, where CS0/ODT0 corresponds to DQ[15:0], CS1/ODT1 corresponds to DQ[31:16], CS2/ODT2 corresponds to DQ[47:32], and CS3/ODT3 corresponds to DQ[63:48]. The address lines are connected to all memory chips. In this mode, ECC cannot be used.

Change it




