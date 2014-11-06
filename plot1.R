#This script assumes the raw data is in your primary working directory

df<-read.table("household_power_consumption.txt",header=TRUE,sep=';')
df$D_Time<-as.POSIXct(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S",tz='EST')


df2<-df
df2$Date<-as.Date(df$Date,format='%d/%m/%Y')
#df2$Time<-strptime(df2$Time,format='%H:%M:%S')

#Filter down to the two target dates
df2<-df2[(df2$Date>='2007-02-01'),]
df3<-df2[(df2$Date<='2007-02-02'),]
df3$Global_active_power<-as.numeric(df3$Global_active_power)/500

#plot 1
png("plot1.png")
hist(df3$Global_active_power,col='red',xlab="Global Active Power (kilowatts)",main='Global Active Power')
dev.off()

