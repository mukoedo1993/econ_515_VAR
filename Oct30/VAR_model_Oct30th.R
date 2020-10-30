library(data.table) 
library(readxl)
library(vars)
library(mFilter)
library(tseries)
library(TSstudio)
library(forecast)
library(tidyverse)
library(ggplot2)
library(quantmod)
library(rugarch)
library(tibble)


df<-read.csv('df_final_forecast.csv')
df0<-read.csv('df_test_ver1.csv')

yen_orig <- ts(df0$jpy,start=c(2019,1,2),frequency=252)
cny_orig <- ts(df0$cny,start=c(2019,1,2),frequency=252)
can_orig <- ts(df0$can,start=c(2019,1,2),frequency=252)
infl_orig <- ts(df0$inflation,start=c(2019,1,2),frequency=252)
inte_orig <- ts(df0$interest,start=c(2019,1,2),frequency=252)

yen_pred <- ts(df$jpy_2d,start=c(2019,1,2),frequency=252)
cny_pred <- ts(df$cny_2d,start=c(2019,1,2),frequency=252)
can_pred <- ts(df$can_2d,start=c(2019,1,2),frequency=252)
infl_pred <- ts(df$inflation_2d,start=c(2019,1,2),frequency=252)
inte_pred <- ts(df$interest_2d,start=c(2019,1,2),frequency=252)

plot(yen_orig,type="l",col="red")
lines(yen_pred,col="green")

plot(cny_orig,type="l",col="red")
lines(cny_pred,col="green")

plot(can_orig,type="l",col="red")
lines(can_pred,col="green")

df_train<-read.csv('df_train_diff.csv')

v1<-cbind(df_train$jpy,df_train$can,df_train$cny,df_train$interest,df_train$inflation)
colnames(v1)<-cbind("jpy","can","cny","interest","inflation")

Model1 <- VAR(v1, p = 1, type = "const", season = NULL, exog = NULL) 
summary(Model1)

##

