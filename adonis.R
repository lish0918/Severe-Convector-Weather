library(xlsx)
library(vegan)
library(ggplot2)
library(ggrepe1)

database=read.xlsx("C://Users//DELL//Desktop//machine learning//ano.xlsx","Sheet1")
dat<-subset(database,select=-type)
group<-subset(database,select=type)


#ADONIS
adonis_result<-adonis2(dat~type,group,permutations=999,method="euclidean",by="margin")
adonis_result

#降维
pca1<-prcomp(dat,center = TRUE,scale. = TRUE)
df1 <- pca1$x
df1 <- as.data.frame(df1)

summ1 <- summary(pca1)
xlab1 <- paste0("PC1(",round(summ1$importance[2,1]*100,2),"%)")
ylab1 <- paste0("PC2(",round(summ1$importance[2,2]*100,2),"%)")

p.pca1 <- ggplot(data = df1,aes(x=PC1,y=PC2,color=database$type))+
  stat_ellipse(aes(fill = database$type),
               type = "norm",geom = "polygon",alpha = 0.25,color = NA)+ # 添加置信椭圆
  geom_point(size = 3.5)+
  labs(x = xlab1,y = ylab1,color = "Condition",title = "PCA Scores Plot")+
  guides(fill = "none")+
  theme_bw()+
  scale_fill_manual(values = c("orange","pink"))+
  scale_colour_manual(values = c("orange","pink"))+
  theme(plot.title = element_text(hjust = 0.5,size = 15),
        axis.text = element_text(size = 11),axis.title = element_text(size = 13),
        legend.text = element_text(size = 11),legend.title = element_text(size = 13),
        plot.margin = unit(c(0.4,0.4,0.4,0.4),'cm'))
p.pca1
