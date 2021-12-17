install.packages("fpp")
library(fpp)


data("euretail")
plot(euretail,ylab="Retail index",xlab="Years")
euretail_timeserie_components = decompose(birthstimeseries)
plot(euretail_timeserie_components)
tsdisplay(euretail)
tsdisplay(diff(euretail,4))
tsdisplay(diff(diff(euretail,4)))

fit<- Arima(euretail,order =c(1,1,0),seasonal = c(1,1,0))
tsdisplay(residuals(fit))
Box.test(residuals(fit),lag=16,type="Ljung")


fit3<- Arima(euretail,order =c(0,1,3),seasonal = c(0,1,1))
tsdisplay(residuals(fit3))
Box.test(residuals(fit3),lag=16,type="Ljung")

plot(forecast(fit3,H=12))
auto.arima(euretail)
