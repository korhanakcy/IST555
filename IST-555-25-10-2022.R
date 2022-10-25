#IS
#R İLE VERİ BİLİMİ 
 #140 ile 195 arasındaki sayılardan 1000 adet veri üretmek
x <- sample(140:195, 1000, replace = T)

 #male(m) ve female(f)'den 1000 adet veri üretmek
y <- sample(c("m","f"), 1000, replace = T)

#dataframe oluşturma
data <- data.frame(y,x)

#sütun isimlerinin değişimi
colnames(data) <- c("height","gender")

data
