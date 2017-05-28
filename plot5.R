vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
subsetSCC <- SCC[vehicle, ]

NEISCC <- merge(baltimore, subsetSCC, by ="SCC")

totalEmissions <- tapply(NEISCC$Emissions, NEISCC$year, sum)

barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission from motor sources in Baltimore")

dev.copy(png, "plot5.png")
dev.off()