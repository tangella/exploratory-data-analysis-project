# read the data set
SCC <- readRDS("../exdata_data_NEI_data/Source_Classification_Code.rds")
NEI <- readRDS("../exdata_data_NEI_data/summarySCC_PM25.rds")

# for plotting the numbers in non exponential form
options(scipen = 10)

#compute the aggregate for plotting
emission_aggregate <- aggregate(Emissions ~ year, data = NEI, sum)

#plot the bar graph to plot1.png

png('plot1.png')

barplot(height = emission_aggregate$Emissions, xlab = "Years", 
        ylab = "total PM 2.5", main="Total PM 2.5 over years", 
        names.arg = emission_aggregate$year, 
        ylim = c(0,max(emission_aggregate$Emissions)))

dev.off()
