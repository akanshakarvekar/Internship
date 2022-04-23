library(fpp2)
library(forecast)
data("ausbeer")

plot.ts(ausbeer)


diff1 = diff(ausbeer,1)
plot.ts(diff1)

Acf(diff1)
Acf(ausbeer)

diff2 = diff(ausbeer,4)
plot.ts(diff2)
Acf(diff2)

decompose_1 = decompose(diff1)
plot(decompose_1)

ses(diff2)
autoplot(ses(diff2))

HoltWinters()