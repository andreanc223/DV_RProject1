library("RCurl", lib.loc="~/R/win-library/3.1")
df_order<- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select ORDERS.ORDER_DATE, ORDERS.ORDER_ID, ORDERS.SHIPPED_DATE, CUSTOMERS.CUSTOMER_STATE, ITEMS.UNIT_PRICE, ITEMS.TITLE, ITEMS.ARTIST FROM ORDERS INNER JOIN CUSTOMERS ON (CUSTOMERS.CUSTOMER_ID = ORDERS.CUSTOMER_ID) INNER JOIN ORDER_DETAILS ON (ORDERS.ORDER_ID = ORDER_DETAILS.ORDER_ID) INNER JOIN ITEMS ON (ORDER_DETAILS.ITEM_ID = ITEMS.ITEM_ID)"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))
library(ggplot2)
library(scales)
df_order$ORDER_DATE <- as.Date(df_order$ORDER_DATE)
#df_order$SHIPPED_DATE <- as.Date(df_order$SHIPPED_DATE)

unit_price <- ggplot(df_order, aes(x=ORDER_DATE, y=SHIPPED_DATE)) + geom_point(aes(color=UNIT_PRICE)) + labs(x="ORDER_DATE", y="SHIPPED_DATE") + scale_x_date(labels=date_format("%Y-%m"))
unit_price + facet_wrap(~CUSTOMER_STATE)

title <- ggplot(df_order, aes(x=ORDER_DATE, y=SHIPPED_DATE)) + geom_point(aes(color=TITLE))
title + facet_wrap(~CUSTOMER_STATE)

artist <- ggplot(df_order, aes(x=ORDER_DATE, y=SHIPPED_DATE)) + geom_point(aes(color=ARTIST))
artist + facet_wrap(~CUSTOMER_STATE)

