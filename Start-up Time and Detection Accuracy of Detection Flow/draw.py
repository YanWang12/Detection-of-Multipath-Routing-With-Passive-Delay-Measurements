# -*- coding: utf-8 -*-
import matplotlib.pyplot as plt
from matplotlib.font_manager import FontProperties
font1 = {
    'family' : 'Arial',
    'weight':'normal',
    'size':15,
}
names = ['[0,1]','[0,2]', '[0,3]', '[0,4]', '[0,5]']
x = [0.9,2.4,3.9,5.4,6.9]
plt.bar([0.5,2,3.5,5,6.5], [0.96,0.94,0.92,0.93,0.84], label='var_Test',width=0.35)
plt.bar([0.9,2.4,3.9,5.4,6.9], [0.82,0.93,1,1,1], label='t_Test',width=0.35)

# params

# x: 条形图x轴
# y：条形图的高度
# width：条形图的宽度 默认是0.8
# bottom：条形底部的y坐标值 默认是0
# align：center / edge 条形图是否以x轴坐标为中心点或者是以x轴坐标为边缘
plt.xticks(x, names)
#rotation=45
font2 = {
    'family' : 'Arial',
    'weight':'normal',
    'size':12,
}
#plt.grid()
plt.tick_params(labelsize=13)
plt.margins(0)
plt.legend(prop=font2)
plt.xlim(0,7.5)  # 限定横轴的范围
plt.ylim(0.7, 1.02)  # 限定纵轴的范围
plt.xlabel('Start_time',font1)
plt.ylabel('Detection accuracy',font1)

#plt.title(u'', FontProperties=font)
plt.savefig("./temp.png")
plt.show()
