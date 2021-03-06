import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from pylab import *
mpl.rcParams['font.sans-serif'] = ['Arial']
x = [3,4,5,6,7,8,9,10]
y1 = [0.9066667,0.9066667,0.9,0.9533333,0.9066667,0.88,0.86,0.89]
y2=  [1,0.88,1,0.9266667,0.8,0.933333,1,0.96]

font1 = {
    'family' : 'Arial',
    'weight':'normal',
    'size':15,
}
plt.xlim(2,11)  # 限定横轴的范围
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
plt.xlabel(u"Number",font1) #X轴标签
plt.ylabel("Detection accuracy",font1) #Y轴标签
plt.savefig("./temp.png")
plt.show()
