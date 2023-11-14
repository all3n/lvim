import os
import sys
from module_a.a import A
from module_b.b import B
a = A()
b = B()
a.run()
b.run()
print(sys.argv)

