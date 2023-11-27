import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
data = pd.read_csv('CaseSoundingIndex_thickera5.csv')

data = data.values
svm = data[:,19]
cnt = [0,0,0,0]
for i in svm:
    if i==0:
        cnt[0]=cnt[0]+1
    elif i==1:
        cnt[1]=cnt[1]+1
    elif i==2:
        cnt[2]=cnt[2]+1
    else:
        cnt[3]=cnt[3]+1
plt.bar(('None','strong convection'),cnt[0:2])
plt.title('With or without strong convection')
plt.text(0,cnt[0]+2,cnt[0],ha='center',va='bottom')
plt.text(1,cnt[1]+2,cnt[1],ha='center',va='bottom')
#plt.text(2,cnt[2]+2,cnt[2],ha='center',va='bottom')
#plt.text(3,cnt[3]+2,cnt[3],ha='center',va='bottom')
plt.show()
