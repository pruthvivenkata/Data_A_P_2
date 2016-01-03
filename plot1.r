#importing the data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#merging the data sets
NEI_SCC=merge(NEI,SCC,by.x="SCC",by.y="SCC", all=FALSE)

#creating the summary and the plots
NEI_SCC$year=as.factor(NEI_SCC$year)
poll_year=group_by(NEI_SCC,year)
png("plot1.png")
with(summarize(poll_year,Emissions=sum(Emissions,na.rm = TRUE)),
     plot(as.character(year), Emissions,type="l",xlab="Year", ylab ="Total Emissions(dbl)"))
dev.off()
