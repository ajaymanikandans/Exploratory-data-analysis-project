coal <- grepl("coal", SCC$Short.Name, ignore.case = T)
subsetSCC <- SCC[coal, ]

NEISCC <- merge(NEI, subsetSCC, by = "SCC")

totalEmissions <- tapply(NEISCC$Emissions, NEISCC$year, sum)

barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission from coal sources")

dev.copy(png,"Plot4.png")
dev.off()

