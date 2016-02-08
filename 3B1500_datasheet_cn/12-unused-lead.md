引脚处理
========

无论相关总线使用与否，相关的电源地信号必须正确连接。

系统配置引脚
------------

系统配置引脚包括 DOTEST、CLKSEL、ICCC_EN、NODEID、PCI_CONFIG，不可
悬空，必须连接正确输入。


LPC 总线
--------

LPC 总线在 GPIO[0]下拉时为 BIOS 启动总线，必须连接 Flash，如果 GPIO[0]上拉则可
以悬空，LPC 总线依赖于 PCI_CLK，所以 PCI_CLK 必须有时钟。

PCI 总线
--------

PCI 总线不使用时可以悬空。但是 LPC/SPI/UART 总线依赖于 PCI_CLK，必须给时钟。


SPI 总线
--------

SPI 总线在 GPIO[0]上拉时为 BIOS 启动总线，必须连接 Flash，如果 GPIO[0]下拉则
可以悬空。


UART/GPIO 总线
--------------

除了 GPIO[1:0]之外的 SPI、UART 或 GPIO 总线不使用时可以悬空。


DDR 总线
--------

DDR 总线不使用时可以悬空。

HyperTransport 总线
-------------------

HyperTransport 总线不使用时可以悬空。

JTAG/EJTAG 总线、TESTCLK
------------------------

JTAG/EJTAG 总线、TESTCLK 不使用时可以悬空。

系统中断管脚
------------

系统中断管理包括 INTn 与 NMIn，不使用时可以悬空。

