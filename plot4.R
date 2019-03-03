
#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

setwd("/Users/t93ku6h/Documents/Development/coursera/Exploratory-Data-Analysis/course-project")
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#get dplyr package
require(dplyr)

#grep for Fuel Comb.*Coal - get boolen vector
combustion <- grepl("Fuel Comb.*Coal",SCC$EI.Sector)

#get unique SCC values
SCC <- unique(SCC$SCC[combustion])

#get coal combustion emissions accross United States
emissions <- NEI[(NEI$SCC %in% SCC),]

#group by emissions by year
emissions <- summarize(group_by(emissions,year),Emissions=sum(Emissions))

#barplot PM in thousands (tons)
x1 <- barplot(height=emissions$Emissions/1000,names.arg=emissions$year,xlab="Year",ylab="Total PM emission in thousands (tons)",ylim=c(0,600),col=emissions$year,main="Total coal combustion PM emission in thousands (tons)")
text(x=x1,y=round(emissions$Emissions/1000,1),label=paste(round(emissions$Emissions/1000,1),"K",sep=""),pos=3,cex=0.8,col="black")


#write to a PNG file
png_file <- "/Users/t93ku6h/Documents/Development/coursera/Exploratory-Data-Analysis/course-project/plot4.png"
dev.print(png, file = png_file, width = 400, height = 400)
dev.off()
