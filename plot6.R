
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?

setwd("/Users/t93ku6h/Documents/Development/coursera/Exploratory-Data-Analysis/course-project")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#get dplyr package
require(dplyr)

#get Baltimore,Maryland and Los Angeles, Califrornia data and type ON-ROAD (motor vehicle)
baltimoreAndLosAngeles <- subset(NEI,((fips=="24510" | fips=="06037") & type=="ON-ROAD"))

#group by emissions by year
emissions <- summarize(group_by(baltimoreAndLosAngeles,fips,year),Emissions=sum(Emissions))

#ggplot PM in tons
ggplot(emissions,aes(x = factor(year),y=Emissions,fill=fips,label=round(Emissions,2))) + xlab("Year") + ylab("Total PM emission in tons") + facet_grid(fips~.,scales="free") + geom_bar(stat="identity") + ggtitle("Total motor vehicle PM emission in tons \nin Baltimore (24510) and Los Angeles (06037)") + geom_label(aes(fill=fips),colour = "white", fontface = "bold")

#write to a PNG file
png_file <- "/Users/t93ku6h/Documents/Development/coursera/Exploratory-Data-Analysis/course-project/plot6.png"
dev.print(png, file = png_file, width = 400, height = 400)
dev.off()
