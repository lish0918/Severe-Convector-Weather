library(xlsx)
library(vegan)
library(ggplot2)

database=read.xlsx("C://Users//DELL//Desktop//machine learning//ano.xlsx","Sheet3")
dat<-subset(database,select=-type)
#dist<-vegdist(dat)

#ANOSIM
anosim_result<-anosim(dat,database$type,permutations=999,distance="euclidean")
summary(anosim_result)
plot(anosim_result, col = c('#FFD700','#FF7F00','#EE2C2C','#D02090'))