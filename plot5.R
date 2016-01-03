#importing the data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#merging the data sets
NEI_SCC=merge(NEI,SCC,by.x="SCC",by.y="SCC", all=FALSE)

#substetting the data set
NEI_SCC_vehicle=NEI_SCC[grepl("vehicle|vehicles", NEI_SCC$SCC.Level.Two, ignore.case=TRUE),]

#creating the summary and the plots
NEI_SCC_vehicle$year=as.factor(NEI_SCC_vehicle$year)
poll_year=group_by(NEI_SCC_vehicle,year)
png("plot5.png")
with(summarize(poll_year,Emissions=sum(Emissions,na.rm = TRUE)),
     plot(as.character(year), Emissions,type="l",xlab="Year", ylab ="Total Emissions from vehicle(dbl)"))
dev.off()