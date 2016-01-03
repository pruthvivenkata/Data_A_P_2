#importing the data sets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#merging the data sets
NEI_SCC=merge(NEI,SCC,by.x="SCC",by.y="SCC", all=FALSE)
#substetting the data set
NEI_SCC_vehicle=NEI_SCC[grepl("vehicle|vehicles", NEI_SCC$SCC.Level.Two, ignore.case=TRUE),]
NEI_SCC_vehicle_Bal_LA=NEI_SCC_vehicle[NEI_SCC_vehicle$fips %in%  c("24510","06037"),]

#creating the summary and the plots
NEI_SCC_vehicle_Bal_LA$year=as.factor(NEI_SCC_vehicle_Bal_LA$year)
poll_year_fips=group_by(NEI_SCC_vehicle_Bal_LA,year,fips)
png("plot6.png")
qplot(year,Emissions, data=summarize(poll_year_fips,Emissions=sum(Emissions,na.rm = TRUE))
      ,facets=.~fips,geom=c("point","smooth"))
dev.off()
