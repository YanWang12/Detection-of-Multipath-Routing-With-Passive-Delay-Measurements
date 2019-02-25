import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from pylab import *
mpl.rcParams['font.sans-serif'] = ['Arial']
x = [22.11985,32.6192,42.19895,53.1349,61.95585,69.976]
y1 = [0.9,0.88,0.9133,0.893333,0.86,0.873333]
y2=  [0.94,0.94,0.88,0.913333,0.866666,1]

font1 = {
    'family' : 'Arial',
    'weight':'normal',
    'size':15,
}
plt.xlim(18,73)  # 限定横轴的范围
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
