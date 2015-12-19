/* Route the LPC interrupt to Core0 INT0 ，对应 CP0_Status 的 IP2*/
*(volatile unsigned char*)0x900000003ff0140a = 0x11;

/* Route the HT1 interrupt to Core0 INT1 ，对应 CP0_Status 的 IP3*/
*(volatile unsigned char*)0x900000003ff01418 = 0x21;

*(volatile unsigned char*)0x900000003ff01419 = 0x21;
*(volatile unsigned char*)0x900000003ff0141a = 0x21;
*(volatile unsigned char*)0x900000003ff0141b = 0x21;
*(volatile unsigned char*)0x900000003ff0141c = 0x21;
*(volatile unsigned char*)0x900000003ff0141d = 0x21;
*(volatile unsigned char*)0x900000003ff0141e = 0x21;
*(volatile unsigned char*)0x900000003ff0141f = 0x21;
