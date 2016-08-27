# Set Your Working Directory
setwd('')

#Load Library
library(forecast)

#Read Data
#Consumer Price Index for All Urban Consumers - Data downloaded from https://fred.stlouisfed.org/series/CPIAUCSL
#Monthly data from 1947 Jan to July 1947

cpiauscl.data <- read.csv('./Data/CPIAUCSL.csv',header = T)

#set out data CPIAUCSL as Time Series so that our algo will recognize it as a time series problem
#here data is monthly data - so have to put frequency = 12

cpiauscl.data$CPIAUCSL <- ts(cpiauscl.data$CPIAUCSL, start = c(1947,1), end = c(2016,7), frequency = 12)

#Plotting - CPIAUCSL
plot(cpiauscl.data$CPIAUCSL)

#see summary of the data
summary(cpiauscl.data)

#Summary of the data
# DATE        CPIAUCSL     
# 1947-01-01:  1   Min.   : 21.48  
# 1947-02-01:  1   1st Qu.: 31.00  
# 1947-03-01:  1   Median : 93.40  
# 1947-04-01:  1   Mean   :103.26  
# 1947-05-01:  1   3rd Qu.:164.75  
# 1947-06-01:  1   Max.   :239.93  
# (Other)   :829    

#Getting inflation for the data
diff.CPIAUSCL <- diff(cpiauscl.data$CPIAUCSL)

#Estimating ARIMA Model
fit.arima.model <- arima(diff.CPIAUSCL, order = c(1,0,0))

#forecasting 
forecast.auscl.model <- forecast(fit.arima.model, h = 5)

#plot the prediction
plot(forecast.auscl.model)
