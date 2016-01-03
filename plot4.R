#importing the data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#merging the data sets
NEI_SCC=merge(NEI,SCC,by.x="SCC",by.y="SCC", all=FALSE)

#substetting the data set
NEI_SCC_coal=NEI_SCC[grepl("coal", NEI_SCC$Short.Name, ignore.case=TRUE),]

#creating the summary and the plots
NEI_SCC_coal$year=as.factor(NEI_SCC_coal$year)
poll_year=group_by(NEI_SCC_coal,year)
png("plot4.png")
with(summarize(poll_year,Emissions=sum(Emissions,na.rm = TRUE)),
     plot(as.character(year), Emissions,type="l",xlab="Year", ylab ="Total Emissions from coal(dbl)"))
dev.off()
