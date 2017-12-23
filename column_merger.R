##I had a project where I asked paritcipants to give me five examples of cyberbullying. I was interested in analyzing the words used by men and women, but not looking at differences between examples within individuals. One way to solve this was to merge the columns together.

##To analyze this data with Meaning Extraction Helper (https://meh.ryanb.cc/), I needed each participants response to be in a seperate text file.

#combine all 5 responses into one column
data <- read.csv("~data.csv")
names(data)
data$response <- paste0(data$V2,". ", data$V3, ". ", data$V4, ". ", data$V5, ". ", data$V6)
data <- data[,c("V1", "response")]
write.csv(data, file="~/Desktop/data_1column.csv")


data1c <- read.csv("~data_1column.csv")
data1c <- data1c[,c("V1", "response")]
data1c$response <- as.character(data1c$response)
data1c$response <- gsub('\\"', '', data1c$response) # remove double quotes from response vector


#save each row as a text file with participant ID as name of file
library(rowr)
l <- len(data)
for (i in 1:l){
  dat = data1c[i, 2]
  partic = male[i,1]
  write(dat, file= sprintf("~/Desktop/txtfiles/%s.txt", partic))
}


