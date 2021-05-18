#Arindam Ghosh
#Task2-Prediction using Unsupervised ML
#========import dataset of=======# 
dataset<-read.csv("E:/task2/dataset.csv")
head(dataset)

#=======required library=======#
library(factoextra)
library(NbClust)

#=======Standardize the data========#
df<-as.data.frame(dataset)
head(df)
df1<-df[,-c(1)]
head(df1)
df2<-df1[,-c(5)]
head(df2)

#===========optimum number of clusters=========#
fviz_nbclust(df2, kmeans, method = "wss") +
  geom_vline(xintercept = 0, linetype = 0)+
  labs(subtitle = "Elbow method")

fviz_nbclust(df2, kmeans, method = "silhouette")+
  labs(subtitle = "Silhouette method")

#======Compute k-means with k = 2=======#
set.seed(123)
km.res <- kmeans(df2, 2, nstart = 25)
km.res
#========graphical representation====#
fviz_cluster(km.res, data = df2,
             palette = c("#2E9FDF", "#00AFBB", "#E7B800", "#FC4E07"),
             ellipse.type = "euclid", # Concentration ellipse
             star.plot = TRUE, # Add segments from centroids to items
             repel = TRUE, # Avoid label overplotting (slow)
             ggtheme = theme_minimal()
)

