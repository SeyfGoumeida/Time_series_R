
#Exercice 1
#Reading Time Series Data
kings <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat",skip=3)
plot(kings)
kingstimeseries =ts(kings, frequency = 12)
births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
plot(births)
birthstimeseries =ts(births, frequency = 12, start = c(1946, 1)) 
plot(birthstimeseries)
print(birthstimeseries, calendar = TRUE)

souvenir <- scan("http://robjhyndman.com/tsdldata/data/fancy.dat")
plot(souvenir)
souvenirtimeseries = ts(souvenir, frequency = 12, start = c(1987, 1))
plot(souvenirtimeseries)
print(souvenirtimeseries, calendar = TRUE)


tseries_lag <- log(souvenirtimeseries)
plot(tseries_lag)

#Exercice 2
#Decomposing Time Series
install.packages("TTR")
library(TTR)
kingstimeseriesSMA3 = SMA(kingstimeseries,n=3)
kingstimeseriesSMA8 = SMA(kingstimeseries,n=8)

plot(kingstimeseries)
lines(kingstimeseriesSMA3,type = "l",col="red")
lines(kingstimeseriesSMA8,type = "l",col="green")
legend(0,25,legend = c("TS","SMA3","SMA8"),col =c("black",'red','green'),lty=1)

#Exercice 3
#Decomposing Seasonal Time Series
birthstimeseriescomponents = decompose(birthstimeseries)
plot(birthstimeseriescomponents)

#plot saisonniere 
plot(birthstimeseriescomponents$seasonal)
#Adjust the seasonality (remove the seasonality) of birthstimeseries, and plot the resultatnts time serie

birthstimeseriescomponentsajust <- birthstimeseries - birthstimeseriescomponents$seasonal
plot(birthstimeseriescomponentsajust)
#la variation saisonniére a été supprimée de la serie 
#la série  contient que la composante tendance et le bruit.


#EXERCICE 4

######################   Forecast using exponential smoothing##############

rain <- scan("http://robjhyndman.com/tsdldata/hurst/precip1.dat",skip=1)
raintimeseries = ts(rain, start=c(1813))
plot (raintimeseries)

# Simple exponential smoothing (no rend no season)

forecasts = HoltWinters(raintimeseries,beta=FALSE,gamma=FALSE)
forecasts$alpha

forecasts$fitted
SSE = forecasts$SSE
SSE
RMSE = sort(SSE/length(rain))
RMSE
plot(forecasts)

#Simple exponential smoothing (no rend no season) - with specifying the first level

forecasts = HoltWinters(raintimeseries, beta=FALSE, gamma = FALSE,l.start=rain[1])
forecasts$alpha

forecasts$fitted

SSE =forecasts$SSE
SSE

RMSE=sqrt(SSE /length(rain))
RMSE
plot(forecasts)         

#5 forcasts in the future
library('forecast')
five_forecast = forecast(forecasts,h=5)
five_forecast
plot(five_forecast)

#ploting residual
five_forecast$residuals
plot(five_forecast$residuals)
