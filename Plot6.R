la <- subset(NEI, fips == "06037")

vehicle  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
subsetSCC <- SCC[vehicle, ]

databalt <- merge(baltimore, subsetSCC, by="SCC")
databalt$city <- "Baltimore City"
datala <- merge(la, subsetSCC, by="SCC")
datala$city <- "Los Angeles County"
mdata <- rbind(databalt, datala)

mdata <- aggregate(Emissions ~ year + city, mdata, sum)

g <- ggplot(mdata, aes(year, Emissions, color = city))
g + geom_line() +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions from motor sources in Baltimore and Los Angeles")

dev.copy(png, "Plot6.png")
dev.off()