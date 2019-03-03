
#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

setwd("/Users/t93ku6h/Documents/Development/coursera/Exploratory-Data-Analysis/course-project")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#get dplyr package
require(dplyr)

#get Baltimore,Maryland data and type ON-ROAD (motor vehicle)
baltimore <- subset(NEI,(fips=="24510" & type=="ON-ROAD"))

#group by emissions by year
emissions <- summarize(group_by(baltimore,year),Emissions=sum(Emissions))

#barplot PM in tons
x1 <- barplot(height=emissions$Emissions,names.arg=emissions$year,xlab="Year",ylab="Total PM emission in tons",ylim=c(0,600),col=emissions$year,main="Total motor vehicle PM emission in tons in Baltimore, Maryland.")
text(x=x1,y=emissions$Emissions,label=round(emissions$Emissions,1),pos=3,cex=0.8,col="black")


#write to a PNG file
png_file <- "/Users/t93ku6h/Documents/Development/coursera/Exploratory-Data-Analysis/course-project/plot5.png"
dev.print(png, file = png_file, width = 400, height = 400)
dev.off()
