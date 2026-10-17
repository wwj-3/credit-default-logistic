library(ISLR2)
library(tidyverse)
library(gtsummary)
library(pROC)
library(performance)
data(Default)
d <- Default%>%mutate(default=factor(default,levels = c("No","Yes")))
chisq.test(table(d$student,d$default))
t.test(balance~default,data=d)
t.test(income~default,data=d)
fit_b <- glm(default~balance,data=d,family=binomial)
fit_s <- glm(default~student,data=d,family=binomial)
fit_i <- glm(default~income,data=d,family=binomial)
library(broom)
tidy(fit_b,exponentiate=T,con.inf=T)
tidy(fit_s,exponentiate=T,con.inf=T)
tidy(fit_i,exponentiate=T,con.inf=T)

fit_multi <- glm(default~student+balance+income,data=d,family=binomial)
tidy(fit_multi,exponentiate=T)

check_collinearity(fit_multi)
d$prob <- predict(fit_multi,type="response")
roc_obj <- roc(d$default,d$prob)
auc(roc_obj)
plot(roc_obj,main="ROC Curve")

d$pred_class <- ifelse(d$prob>0.5,"Yes","No")
table(Predicted=d$pred_class,Actual=d$default)
library(rmarkdown)




