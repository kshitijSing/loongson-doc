复位时序要求
============

龙芯 3B1500 的初始化分为Core时钟域、DDR2/3 时钟域、HT相关时钟域和PCI时钟域。当
处理器复位信号SYSRESETn为低时，相关的时钟，测试信号和初始化信号都必须有效。这些
信号包括：

  - SYSCLK，MEMCLK，HTCLK，PCI_CLK，CLKSEL，差分时钟 ht0_clkp/ht0_clkn 和差分时
    钟 ht1_clkp/ht1_clkn，这些信号必须稳定。
  - 初始化信号 PCI_CONFIG 应该被设置为合适的值。
  - ICCC_EN 和 NODE_ID 必须稳定（在复位结束前设置完毕并保持不变，信号意义见下文
    第二段）。

当SYSRESETn变高后，处理器内部的复位逻辑开始初始化芯片。SYSRESETn 应至少保持一个
时钟周期内（相对于SYSCLK）有效，以保证复位逻辑能可靠采样。PCI时钟域将会被首先初
始化以保证龙芯 3B1500 中基本配置寄存器的有效，当龙芯 3B1500 作为PCI Master 时还
会输出PCI_RESETn来复位外部PCI设备。此后Core、DDR2/3 和HT时钟域相继初始化完成并
根据配置引脚的输入去复位外部设备。

ICCC_EN信号为Inter Connection Cache Coherence Enable的缩写，此信号用于多片互联时
维护cache一致性。NODE_ID信号用于在多片互联时用来设置处理器号。

龙芯 3B1500 的复位时序图如下所示，图中黑色信号为外部信号，浅色信号为内部信号，
用户无需关心。

图 6-1 龙芯 3B1500 复位时序图
