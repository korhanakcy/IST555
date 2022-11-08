#IST-555
#R İLE VERİ BİLİMİ 
#140 ile 195 arasındaKİ sayılardan 1000 adet veri üretmek
library(dplyr)

set.seed(2510)
x <- sample(140:195, 1000, replace = T)

#male(m) ve female(f)'den 1000 adet veri üretmek
set.seed(2510)
y <- sample(c("m","f"), 1000, replace = T)

# 45 ila 100 arasında 1000 adet kilo verisi 
set.seed(99)
weight <- sample(45:100, 1000, replace = T)

#dataframe oluşturma
data <- data.frame(y,x,weight)

#sütun isimlerinin değişimi
colnames(data) <- c("gender","height","weight")


model <- lm(x ~ weight, data = data)
summary(model)

data
#tüm kadınları ve erkeklerin gruplara ait uzunlukları getiren fonksiyon
filter(data, gender == "f") %>% summarise(mean=mean(height))

filter(data, gender == "m") %>% summarise(mean=mean(height))

#aynı işlem
group_by(data, gender) %>% summarise(mean=mean(height))

y = as.factor(y)

# y_new ' de m 'i 1 ve f 'i 0 olarak kodladım data_new olarak oluşturdum
#y_new <- ifelse(data$gender=="m",1,0)
#data_new <- data.frame(y_new,x,weight)

#data_new

#data

#verinin varyansı
group_by(data, gender) %>% summarise(mean=var(height))
#verinin standart sapması
group_by(data, gender) %>% summarise(mean=sd(height))
#verinin min ve maxı
group_by(data, gender) %>% summarise(mean=min(height))
group_by(data, gender) %>% summarise(mean=max(height))

lm(x ~ weight, data = data)

model <- lm(x ~ weight, data = data)
summary(model)
model
par(mfrow = c(1,1))
par(mfrow = c(2,2))
plot(model)

# model y_hat = 95+1*weight
# parametreler anlamlı ve r^2(belirlilik katsayısı)(açıklayıcılık) 1 olarak bulunmuştur.

plot(x,weight)
abline(model, col = "red")

ggplot(data, aes(x = x, y = weight)) + 
  geom_point() +
  stat_smooth(method = "lm", col = "red", )


ggplot(data, aes(x, weight)) +   
  geom_point()+
  stat_smooth(method = "lm",
            formula = y ~ x,
            geom = "smooth")

#ÖDEV 2
#RMD VE PDF VE R SCPRIT

#TEX LİVE KUR

#Residuals vs Fitted. Used to check the linear relationship assumptions. A horizontal line, 
#without distinct patterns is an indication for a linear relationship, what is good.

#Normal Q-Q. Used to examine whether the residuals are normally distributed. It’s good if residuals points follow the straight dashed line.

#Scale-Location (or Spread-Location). Used to check the homogeneity of variance of the residuals (homoscedasticity). 
#Horizontal line with equally spread points is a good indication of homoscedasticity. 
#This is not the case in our example, where we have a heteroscedasticity problem.

#Residuals vs Leverage. Used to identify influential cases, that is extreme values 
#that might influence the regression results when included or excluded from the analysis. 
#This plot will be described further in the next sections.