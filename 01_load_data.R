install.packages(c("ISLR2","pROC", "performance","here"))
library(tidyverse)
library(gtsummary)
library(ISLR2)
library(pROC)
library(performance)
library(here)
library(broom)
install.packages("ISLR2")
data(Default)
head(Default)
summary(Default)
glimpse(Default)
nrow(Default)
table(Default$default)
Default%>%count(default)
d <- Default
d <- d%>%mutate(default=factor(default,levels=c("No","Yes")))
levels(d$default)
table(d$default)






















