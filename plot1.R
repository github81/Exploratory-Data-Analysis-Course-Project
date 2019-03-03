
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

setwd("/Users/t93ku6h/Documents/Development/coursera/Exploratory-Data-Analysis/course-project")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

#get dplyr package
require(dplyr)

#group by emissions by year
emissions <- summarize(group_by(NEI,year),Emissions=sum(Emissions))

#barplot PM in millions (tons)
x1 <- barplot(height=emissions$Emissions/1000000,names.arg=emissions$year,xlab="Year",ylab="Total PM emission in millions (tons)",ylim=c(0,8),col=emissions$year)
text(x=x1,y=round(emissions$Emissions/1000000,1),label=paste(round(emissions$Emissions/1000000,1),"M",sep=""),pos=3,cex=0.8,col="black")

#write to a PNG file
png_file <- "/Users/t93ku6h/Documents/Development/coursera/Exploratory-Data-Analysis/course-project/plot1.png"
dev.print(png, file = png_file, width = 400, height = 400)
dev.off()
