library(ggplot2)
# read the data set
SCC <- readRDS("../exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("../exdata_data_NEI_data/summarySCC_PM25.rds")

# for plotting the numbers in non exponential form
options(scipen = 10)

#compute the aggregate for plotting for Baltimore City, Maryland (fips == "24510") 
NEI_Baltimore <- NEI[NEI$fips =="24510" & NEI$type == "ON-ROAD", ]

# merge NEI_Baltimore and SCC
NEI_Baltimore_SCC <- merge(NEI_Baltimore, SCC, by = "SCC")

emission_aggregate <- aggregate(Emissions ~ year, data = NEI_Baltimore_SCC, sum)

#plot the bar graph to plot5.png

png('plot5.png')

gg <- ggplot(emission_aggregate,aes(factor(year), Emissions))
gg <- gg + geom_bar(stat = "identity")
gg <- gg + xlab("Years") + ylab("total PM 2.5") + 
        ggtitle("Total PM 2.5 over years for Baltimore City, Maryland by Motor Vehicle(type ='ON-ROAD")
print(gg)
dev.off()
