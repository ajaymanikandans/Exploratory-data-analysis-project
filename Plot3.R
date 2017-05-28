library(ggplot2)

databalt <- aggregate(Emissions ~ year + type, baltimore, sum)

gplot <- ggplot(databalt, aes(year, Emissions, color = type))

gplot + geom_line()+ xlab("year") + ylab(expression("Total P.M"[2.5]*" Emissions")) + ggtitle("Total Emissions per type in Baltimore")

dev.copy(png, "Plot3.png")
dev.off()