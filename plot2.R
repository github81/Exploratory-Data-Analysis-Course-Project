
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

setwd("/Users/t93ku6h/Documents/Development/coursera/Exploratory-Data-Analysis/course-project")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

#get dplyr package
require(dplyr)

#get Baltimore,Maryland data
baltimore <- subset(NEI,fips=="24510")

#group by emissions by year
emissions <- summarize(group_by(baltimore,year),Emissions=sum(Emissions))

#basic plot PM in thousands (tons)
emissionValues <- round(emissions$Emissions/1000,1)
with(emissions,plot(year,emissionValues,type="l",lwd=2,xlab="Year",ylab="Total PM emission in thousands (tons)",main="Total PM emission in thousands (tons) in Baltimore, Maryland",axes = FALSE))
axis(2, at = emissionValues, labels = paste(emissionValues, "K", sep = ""))
axis(1, at = c(1999,2002,2005,2008))
box()

#write to a PNG file
png_file <- "/Users/t93ku6h/Documents/Development/coursera/Exploratory-Data-Analysis/course-project/plot2.png"
dev.print(png, file = png_file, width = 400, height = 400)
dev.off()
