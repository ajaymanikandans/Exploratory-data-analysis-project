baltimore <- subset(NEI, fips == "24510")

totalEmissions <- tapply(baltimore$Emissions, baltimore$year, sum)

barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission per year in Baltimore")

dev.copy(png, "Plot2.png")
dev.off()