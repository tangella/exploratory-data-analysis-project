# read the data set
SCC <- readRDS("../exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("../exdata_data_NEI_data/summarySCC_PM25.rds")

# for plotting the numbers in non exponential form
options(scipen = 10)

#compute the aggregate for plotting for Baltimore City, Maryland (fips == "24510") 
NEI_Baltimore <- subset(NEI, fips =="24510", select = c(Emissions,year))
emission_aggregate <- aggregate(Emissions ~ year, data = NEI_Baltimore, sum)

#plot the bar graph to plot2.png

png('plot2.png')

barplot(height = emission_aggregate$Emissions, xlab = "Years", 
        ylab = "total PM 2.5", main="Total PM 2.5 over years for Baltimore City, Maryland", 
        names.arg = emission_aggregate$year, 
        ylim = c(0,max(emission_aggregate$Emissions)))

dev.off()
