library('xlsx')
setwd("C:/Users/DELL/Desktop/machine learning")
data<-read.xlsx("ano.xlsx")
xx<-colnames(data)
xx

otu<-data$YN_SC
#计算距离
dist <- vegdist(data)
anosim <- anosim(otu,group$group,distance="bray",permutations=999)
summary(anosim)
plot(anosim)
