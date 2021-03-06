#### [python] combine several csv ####
###########################################################

###########################################################
#### [r] do data clean and visualisation #################
# set package
library(dplyr)
library(data.table)
library(tidyr)
library(dplyr)
#install.packages("sqldf")
library(sqldf)
library(ggplot2)

# read.csv blank fields to NA 
df1 <- read.csv("output2.csv", header=T, na.strings=c("","NA"))

# handle missing values,omit na
df2 <- na.omit(df1)

# remove extra heading line
df3 <- df2[df2$x != "x",]


# type and range checking

df3$frame_id <- as.character(df3$frame_id)
df3$frame_id <- as.numeric(df3$frame_id)
typeof(df3$frame_id)
range(df3$frame_id)

df3$track_id <- as.character(df3$track_id)
df3$track_id <- as.numeric(df3$track_id)
typeof(df3$track_id)
range(df3$track_id)

df3$x <- as.character(df3$x)
df3$x <- as.numeric(df3$x)
typeof(df3$x)
range(df3$x)

df3$y <- as.character(df3$y)
df3$y <- as.numeric(df3$y)
typeof(df3$y)
range(df3$y)

df3$w <- as.character(df3$w)
df3$w <- as.numeric(df3$w)
typeof(df3$w)
range(df3$w)

df3$h <- as.character(df3$h)
df3$h <- as.numeric(df3$h)
typeof(df3$h)
range(df3$h)

#### changing the the column header in a data.frame ###################
df4 <- rename(df3, date = testdata2.20151008.csv )

#### change the format of first column(date) ##########################
df4$date<-gsub('testdata2/','',df4$date)
df4$date<-gsub('.csv','',df4$date)

df4$date <- as.numeric(df4$date)
typeof(df4$date)
range(df4$date)


#### combine first column (date) with third column (track_id) ####
df5 <- df4[order(df4$date),] 
df5 <- transform ( df5 , dateid = paste(date,track_id, sep = ""))
df5 <- transform ( df5 , allid = paste(date,frame_id,track_id, sep = ""))
a <- df5[duplicated(df5$allid),] #check repeat

#write.csv(df5,"after_first_combine.csv")
########################################################################

########################################################################
#### find non-person###################################################

# Create the mode function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
# Calculate the mode using the user function.
result <- getmode(df5$y)
result <- getmode(df5$x)
print(result)

summary(df5$x)
getmode(df5$x)

# df7 <- df5
# 
# library(ggplot2)
# # Basic box plot
# # p <- ggplot(df5, aes(x=date, y=df5$x)) + 
# #   geom_boxplot()
# # p
# 
# # p <- ggplot(df5, aes(df5$x, df5$y))
# # p + geom_point()
# # 
# # check1 <- sqldf('select * from df5 where y <=1')
# # check1$x <- as.numeric(check1$x)
# # summary(check1$x)
# # p <- ggplot(check1, aes(check1$x, check1$y))
# # p + geom_point()
# 
# df5$x <- as.numeric(df5$x)
# df5$y <- as.numeric(df5$y)
# 
# check1 <- sqldf('select * from df5 WHERE (x NOT BETWEEN -1000 AND 50)')
# 
# check1$x <- as.numeric(check1$x)
# check1$y <- as.numeric(check1$y)
# 
# write.csv(check1,"check1.csv")
# 
# check2 <- check1[,c(4,5)]
# check2$x <- as.numeric(check1$x)
# check2$y <- as.numeric(check1$y)
# check2 <- rename(check2, "1" = x )
# check2 <- rename(check2, "2" = y )
# write.csv(check2,"check2.csv")




# p <- ggplot(check1, aes(check1$x, check1$y))
# p + geom_point()
# 
# check1$x <- as.numeric(check1$x)
# check1$y <- as.numeric(check1$y)
# 
# summary(check1$x)
# summary(check1$y)
# p <- ggplot(check1, aes(check1$x, check1$y))
# p + geom_point()
# 
# p + geom_point(aes(x = check1$x, y = check1$y), size = 2, col="red",data = check1, alpha = 1)
# 
# check1$x <- as.numeric(check1$x)
# check1$y <- as.numeric(check1$y)
# p +geom_point(aes(x = check1$x, y = check1$y), 
#               size = 1, col="red",data = check1, alpha = 1)
# p + stat_density2d(data = check1, aes(x =check1$x, y = check1$y )
#                 ,size = 0.1) + scale_fill_gradient(low = "green", high = "red",guide = FALSE)+scale_alpha(range = c(0, 0.3), guide = FALSE)

#############################################################################
df6 <- df5
#checky df5
df5y <- sqldf('select *, count(y) from df6 group by y')
df5x <- sqldf('select *, count(x) from df6 group by x')

# remove non-person
df6 <- df5[df5$y != "33",]
df6 <- df6[df6$y != "34",]
df6 <- df6[df6$y != "145",]
df6 <- df6[df6$y != "256",]
df6 <- df6[df6$y != "367",]
df6 <- df6[df6$y != "478",]
df6 <- df6[df6$y != "579",]

df7 <- df6 %>% 
  filter (x>0 & y>50)

df7 <- df6 %>% 
  filter (!((x>100 & x<300 & y>0  &y<400)))



p <- ggplot(df7, aes(df7$x, df7$y))
p + geom_point()
#write.csv(df7,"after_clean.csv")

######################################################################
################ heatmap ##############################################   
x1 <- df7$x
x2 <- df7$y
df <- data.frame(x1,x2)
## Use densCols() output to get density at each point
x <- densCols(x1,x2, colramp=colorRampPalette(c("black", "white")))
df$dens <- col2rgb(x)[1,] + 1L
## Map densities to colors
cols <-  colorRampPalette(c("#ffffff","#ffffff", "#45FE4F", 
                            "#FCFF00", "#FF9400", "#FF3100"))(256)
df$col <- cols[df$dens]
## Plot it, reordering rows so that densest points are plotted on top
plot(x2~x1, data=df[order(df$dens),], pch=20, col=col, cex=2)

########################################################################
#### get unique id and count them individually for daily ################
#### both sum (count) for daily and sum for occuring times (duration)####

#j <- aggregate(df5$date,by=list(dateid=dateid),count)

# get count of pedestrian for every day
out1 <- sqldf('select date, count(distinct(track_id)) from df7 group by date')
out1 <- rename(out1, "count" = "count(distinct(track_id))" )

# get the duration of each pedestrian
out2 <- sqldf('select date,dateid, count(dateid) from df6 group by dateid')
out2 <- rename(out2, "duration" = "count(dateid)" )
# out2 <- sqldf('select * from out2 WHERE duration < 500')
range(out2$duration)
summary(out2$duration)
# get the average duration of each day
out3 <- sqldf('select date, avg(duration) from out2 group by date')
out3 <- rename(out3, "avg_duration" = "avg(duration)" )

##################combine####################################
out_day <- merge(out1, out3, by = "date")
write.csv(out_day,"daily_info.csv")
########################################################################
