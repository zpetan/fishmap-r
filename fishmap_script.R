# Load Excel file
library(readxl)
data <- read_excel("~/Github/blog-nonpublic/static/2020_fishing.xlsx", 
                            col_types = c("date", "text", "text", 
                                          "text", "numeric", "numeric", "text", 
                                          "text", "text"))


# Create leaflet map using entries from dataframe
library(leaflet)
leafMap <- leaflet() %>%
        addTiles() %>%
        addMarkers(lng=data$Longitude,data$Latitude, 
                   popup=paste(
                               "Fish:", "<b>",data$Fish,"</b>","<br>",
                               "Size:", data$Size,"</b>","<br>",
                               "Day:", data$Date,"</b>","<br>",
                               "Time:", data$Time,"</b>","<br>",
                               "Weather:", data$Weather,"</b>","<br>",
                               "Method:", data$Method,"</b>","<br>"),
                   label=data$Location)



# Safe map as static html file
library(htmlwidgets)
library(htmltools)

currentWD <- getwd()
#setwd(currentWD)
saveWidget(leafMap, "leafMapFish.html")

