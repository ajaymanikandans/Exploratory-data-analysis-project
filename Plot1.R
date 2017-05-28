# reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# summing emission data per year
totalEmissions <- tapply(NEI$Emissions, NEI$year, sum)

barplot(totalEmissions, xlab = "year", ylab = "Total Emission (Ton)",
        main = "TotalEmission Per Year")

dev.copy(png, "Plot1.png")
dev.off()