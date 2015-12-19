/* Route the LPC interrupt to Core0 INT0 ，对应 CP0_Status 的 IP2*/
*(volatile unsigned char*)0x900000003ff0140a = 0x11;

/* Route the I8259 interrupt to Core0 INT1 ,对应 CP0_Status 的 IP3*/
*(volatile unsigned char *)(0x900000003ff01400) = 0x21;

/* Route PCI interrupt to Core0 INT3,对应 CP0_Status 的 IP5*/
*(volatile unsigned char *)(0x900000003ff01404) = 0x81;
