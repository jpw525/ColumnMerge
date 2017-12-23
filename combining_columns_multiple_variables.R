##I collected data using Qualtrics and had men and women see different intstructions (names of a competitor were changed to match the same sex as the participant). After that, all the questions were the same but since I used branching in qualtrics, I had seperate columns for men and women on the same items. I wanted to combine columns to have response column that included both men and women. 

data <- read.csv("~/Documents/Research/data_cleaned.csv")


data[is.na(data[,5]),5] <- data[is.na(data[,5]),37]


##the way the data downloaded from Qualtrics had the responses from my conditions for women (4 total columns) with 32 columns between those and the responses from men. 
##combine male and female DVs

j=3 #first variable in column 4, offest = 1 by adding 3 (i+j =4, = first column of interst)
k=32 #32 columns between female column and corresponding male column

for(i in 1:k){
  data[is.na(data[,i+j]),i+j] <- data[is.na(data[,i+j]),i+j+k]
}

##Next, I wanted to combine the responses for my DV. Women's responses were in columns 79 - 82 and men's were in columns 83 - 86 (4 columns).
#combine male and female columns for influence questions

l=78 #want column 79, offest by 78 since i=1
m=4
for(i in 1:m){
  data[is.na(data[,i+l]),i+l] <- data[is.na(data[,i+l]),i+l+m]
}

