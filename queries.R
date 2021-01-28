library(DBI)
library(RMySQL)
library(dplyr)
library(ggplot2)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
head(DataDB)

esp <-  DataDB %>% filter(Language == "Spanish")

df <- as.data.frame(esp)

head(df)

ggplot(df,aes(x=CountryCode,y=Percentage,fill = IsOfficial))+geom_bin2d()+coord_flip()
