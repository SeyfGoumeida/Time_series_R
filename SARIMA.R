install.packages("fpp")
library(fpp)
euretail_timeserie =ts(euretail)
plot(euretail_timeserie)
#stationarity = Non 
compose(euretail_timeserie)
euretail_timeserie_components = decompose(birthstimeseries)
plot(euretail_timeserie_components)
# For monthly data, in which there are 12 periods in a season, the seasonal difference of Y at period t is Y(t)-Y(t-12)
# Change plot size to 8 x 3
options(repr.plot.width=20, repr.plot.height=6)
plot(euretail_timeserie)
plot(acf(euretail_timeserie))
