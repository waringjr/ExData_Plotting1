df<-read.table("household_power_consumption.txt",header=TRUE,sep=';')
df$D_Time<-as.POSIXct(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S",tz='EST')

df2<-df
df2$Date<-as.Date(df$Date,format='%d/%m/%Y')
df2$Time<-strptime(df2$Time,format='%H:%M:%S')

#Filter down to the two target dates
df2<-df2[(df2$Date>='2007-02-01'),]
df3<-df2[(df2$Date<='2007-02-02'),]
df3$Global_active_power<-as.numeric(df3$Global_active_power)/500

#plot 4
png("plot4.png")

par(mfrow=c(2,2))

plot(y=df3$Global_active_power,x=df3$D_Time,type='l',xlab='',ylab='Global Active Power')

plot(y=df3$Voltage,x=df3$D_Time,type='l',xlab='datetime',ylab='Voltage')

plot(y=df3$Sub_metering_1,x=df3$D_Time,type='l',xlab='',ylab='Energy sub metering')
lines(y=df3$Sub_metering_2,x=df3$D_Time,type='l',col='red')
lines(y=df3$Sub_metering_3,x=df3$D_Time,type='l',col='blue')

plot(y=df3$Global_reactive_power,x=df3$D_Time,type='l',xlab='datetime',ylab='Global_reactive_power')


dev.off()
