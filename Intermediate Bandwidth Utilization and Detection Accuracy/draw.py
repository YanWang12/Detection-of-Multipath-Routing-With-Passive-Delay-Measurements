import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from pylab import *
mpl.rcParams['font.sans-serif'] = ['Arial']
x = [68.7804667,59.8094667,58.380766,46.3107667,25.1470334]
y1 = [0.8866667,0.973333,1,0.9866667,0.96]
y2=  [0.92,0.82,0.88,1,0.9933333]


font1 = {
    'family' : 'Arial',
    'weight':'normal',
    'size':15,
}
plt.xlim(20,73)  # 限定横轴的范围
plt.ylim(0.75, 1.02)  # 限定纵轴的范围
plt.plot(x, y1, marker='o', ms=15, label=u'var_Test',lw=3)
plt.plot(x, y2, marker='*', ms=18, label=u't_Test',lw=3)
font2 = {
    'family' : 'Arial',
    'weight':'normal',
    'size':15,
}
plt.tick_params(labelsize=15)
plt.legend(loc=3,prop=font2)  # 让图例生效
plt.grid()
plt.margins(0)
plt.subplots_adjust(bottom=0.15)
plt.xlabel(u"Bandwidth utilization",font1) #X轴标签
plt.ylabel("Detection accuracy",font1) #Y轴标签
plt.savefig("./temp.png")
plt.show()
