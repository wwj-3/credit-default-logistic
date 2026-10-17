library(tidyverse)
library(ISLR2)
d <- data(Default)
d <- Default
d <- d%>%mutate(default=factor(default,levels=c("No","Yes")))
levels(d$default)
table(d$default)
colSums(is.na(d))
summary(d)
sum(d$balance<0)
sum(d$income<0)
table(d$student,d$default)
                                                                                                                                        