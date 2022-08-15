# Better GDB defaults ----------------------------------------------------------

# 显示函数参数地址
set print address on
# 格式化显示数组元素
set print array off
# 显示数组的下标
set print array-indexes on
# 最大可显示的数组元素个数
set print elements 200
# 字符串输出只到达终止符
set print null-stop on
# pretty print
set print pretty on
# 显示结构体时，显示内部 enum 的数据
set print union on
# 考虑虚函数表显示对象
set print object on
# 显示指针时显示符号的名字
set print symbol on
# 显示静态成员对象
set print static-members on
#
set print demangle on
#
set print sevenbit-strings off
#
set python print-stack full
# 当输出信息很多时，不要暂停输出
set pagination off

# 退出时不显示提示信息
set confirm off
# 保存历史命令
set history save on
set history filename ~/.gdb_history
set verbose off

# 设置 pending 断点，用来调试暂时没有 symbol table 的 simulator 动态库代码
set breakpoint pending on

python
import sys
sys.path.insert(0, '/home/e00618/gdb_stl_pretty_printer/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end

python
import sys
sys.path.insert(0, '/home/e00618/llvm-project/llvm/utils/gdb-scripts')
from prettyprintersbak import register_llvm_printers
register_llvm_printers ()
end

set prompt \033[31m(gdb) \033[0m
