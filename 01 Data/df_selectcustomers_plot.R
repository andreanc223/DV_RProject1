#add libraries
library("RCurl", lib.loc="~/R/win-library/3.1")
library(ggplot2)
library(extrafont)
library(scales)

#create data frame
df_cust <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from customers"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

#create ggplot
g <- ggplot(df_cust, aes(x=CUSTOMER_STATE)) + geom_histogram()

# add title and x and y labs
g<-g+labs(x="State", y="Number of Customers", title="Orders")

# make title bold
g <-g+theme(plot.title = element_text(size=30,lineheight=.8, vjust=1,family="Bauhaus 93"))

#format x and y axis
g <-g + theme(axis.text.x=element_text(angle=50, size=20, vjust=0.5))

#print plot
g

