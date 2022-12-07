library(readxl)
library(tensorflow)
library(tidyverse)
library(dplyr)

#Veri setinin linki
#"https://storage.googleapis.com/ty2020/reco.csv.gz"

trdata <- read.csv("C:/Users/E. Korhan AKÇAY/Desktop/reco.csv", encoding="UTF-8")

summary(trdata)
is_null(trdata)
  
#Wordcloud 

library(wordcloud)
  
trdata %>%
  count(category_name) %>% 
  with(wordcloud(category_name, n, max.words = 40),random.order=F, rot.per=.15, colormap='Set1')


cleaned_one = trdata %>% select (-c(X.U.FEFF.partition_date, price, ImageLink))

cleaned_two = cleaned_one %>% group_by(user_id)
cleaned_th = cleaned_two %>% count(user_id)
as.data.frame(cleaned_th)

cleaned_data = cleaned_th[cleaned_th$n > 4,]

data <- merge(cleaned_data,cleaned_two, by = "user_id" ,copy= F)
data

data <- data %>% select(-c(n))

str(data)

#dplyr ile sütun bazlı istatistiklerin hepsini yap