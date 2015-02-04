#add libraries
library("RCurl", lib.loc="~/R/win-library/3.1")
library(ggplot2)
library(extrafont)
library(scales)

#create data frame
df_details <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from order_details"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

#create ggplot
g <- ggplot(df_details, aes(x=ITEM_ID)) + geom_histogram()

#print plot
g

