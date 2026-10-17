library(ISLR2)
library(tidyverse)
library(gtsummary)
d <- Default
d <- d%>%mutate(default=factor(default,levels=c("No","Yes")))
table1 <- d%>%
  select(default,student,balance,income)%>%
  tbl_summary(
    by=default,
    statistic=list(
      all_continuous()~"{mean}({sd})",
      all_categorical()~"{n}({p}%)"
    ),
    digits=all_continuous()~2
  )%>%
  add_p%>%
  add_overall()

table1 %>%
  as_tibble() %>%
  write_csv("output/descriptive.csv")

p1 <- ggplot(d,aes(x=default,y=balance,fill=default))+
  geom_boxplot()+
  labs(
    title="行用卡余额与违约关系",
    x="是否违约",
    y="行用卡余额"
  )+
  theme_minimal()
p1
ggsave("output/boxplot_balance.png",p1,width=6,height=4)

p2 <- ggplot(d,aes(x=default,y=income,fill=default))+
  geom_boxplot()+
  labs(
    title="行用卡违约与收入的关系",
    x="是否违约",
    y="收入情况"
  )+
  theme_minimal()
p2
ggsave("output/boxplot_income.png",p2,width=6,height=4)

p3 <- ggplot(d,aes(x=student,fill=default))+
  geom_bar(position = "fill")+
  labs(
    title="银行卡违约与学生的关系",
    x="是否违约",
    y="是否是学生"
  )+
  theme_minimal()
p3
ggsave("output/bar_student.png",p3,width=6,height=3)







