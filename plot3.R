library(ggplot2)
# read the data set
SCC <- readRDS("../exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("../exdata_data_NEI_data/summarySCC_PM25.rds")

# for plotting the numbers in non exponential form
options(scipen = 10)

#compute the aggregate for plotting for Baltimore City, Maryland (fips == "24510") 
NEI_Baltimore <- subset(NEI, fips =="24510", select = c(Emissions,year,type))
emission_aggregate <- aggregate(Emissions ~ year + type, data = NEI_Baltimore, sum)

#plot the line graph to plot3.png

png('plot3.png')

gg <- ggplot(emission_aggregate,aes(year, Emissions, color = type))
gg <- gg + geom_line()
gg <- gg + xlab("Years") + ylab("total PM 2.5") + 
        ggtitle("Total PM 2.5 over years for Baltimore City, Maryland by Type")
print(gg)
dev.off()
