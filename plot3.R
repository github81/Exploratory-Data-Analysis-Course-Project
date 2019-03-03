
#Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

setwd("/Users/t93ku6h/Documents/Development/coursera/Exploratory-Data-Analysis/course-project")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

#get dplyr package
require(dplyr)

#get Baltimore,Maryland data
baltimore <- subset(NEI,fips=="24510")

#group by emissions by year
emissions <- summarize(group_by(baltimore,type,year),Emissions=sum(Emissions))

#ggplot PM in tons
ggplot(emissions,aes(x = factor(year),y=Emissions,fill=type)) + xlab("Year") + ylab("Total PM emission in tons") + facet_grid(. ~ type) + geom_bar(stat = "identity") + theme(axis.text.x=element_text(angle = 90, vjust = 0.5, hjust = 1)) + ggtitle("Total PM emission in tons in Baltimore,Maryland by Source Type")

#write to a PNG file
png_file <- "/Users/t93ku6h/Documents/Development/coursera/Exploratory-Data-Analysis/course-project/plot3.png"
dev.print(png, file = png_file, width = 400, height = 400)
dev.off()
