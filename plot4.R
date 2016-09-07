library(ggplot2)
# read the data set
SCC <- readRDS("../exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("../exdata_data_NEI_data/summarySCC_PM25.rds")

# for plotting the numbers in non exponential form
options(scipen = 10)

# merge NEI and SCC
NEI_SCC <- merge(NEI, SCC, by = "SCC")

# set coal to matching 'coal' in Short.Name
coal<- grep("coal", NEI_SCC$Short.Name, ignore.case = TRUE)

emission_aggregate <- aggregate(Emissions ~ year , data = NEI_SCC[coal,], sum)

#plot the bar graph to plot4.png

png('plot4.png')

gg <- ggplot(emission_aggregate,aes(factor(year), Emissions))
gg <- gg + geom_bar(stat = "identity")
gg <- gg + xlab("Years") + ylab("total PM 2.5") + 
        ggtitle("Total PM 2.5 over years for Coal")
print(gg)
dev.off()
