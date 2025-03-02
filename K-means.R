install.packages('ggplot2') 
library(ggplot2)
library(cluster)
library(fpc)
# menyiapkan Data 
data = mtcars 
View(data)
# Kita perlu menskalakan data agar memiliki mean nol dan varians unit 
data <- scale(data) 
View(data)
# Tentukan jumlah cluster 
wss <- (nrow(data)-1)*sum(apply(data,2,var))
for (i in 2:dim(data)[2]) {
  wss[i] <- sum(kmeans(data, centers = i)$withinss)
} 
# Plot the clusters 
plot(1:dim(data)[2], wss, type = "b", xlab = "Number of Clusters",
     ylab = "Within groups sum of squares")

# Analisis Cluster K-Means
fit <- kmeans(data, 2) # 2 cluster solution 

# sarana cluster 
aggregate(data,by = list(fit$cluster),FUN = mean) 
# tambahkan tugas cluster 
data <- data.frame(data, fit$cluster) 
View(data)

#plot Cluster
clusplot(data, fit$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)
