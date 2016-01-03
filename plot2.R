#importing the data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#merging the data sets
NEI_SCC=merge(NEI,SCC,by.x="SCC",by.y="SCC", all=FALSE)
#substetting the data set
NEI_SCC_Bal=NEI_SCC[NEI_SCC$fips=="24510",]

#creating the summary and the plots
NEI_SCC_Bal$year=as.factor(NEI_SCC_Bal$year)
poll_year=group_by(NEI_SCC_Bal,year)
png("plot2.png")
with(summarize(poll_year,Emissions=sum(Emissions,na.rm = TRUE)),
     plot(as.character(year), Emissions,type="l",xlab="Year", ylab ="Total Emissions(dbl)"))
dev.off()
