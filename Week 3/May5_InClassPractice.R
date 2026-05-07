#In-Class Practice: using R datasets and makin our own practice datasets to test data
#May 5, 2026

library(tidyverse)
library(here)
library(janitor)
library(dplyr)

firestarts = runif(20, min=0, max=100)
ggplot(data.frame(firestarts=firestarts),
       aes(firestarts)) + geom_histogram()

otterweight = rnorm(20, mean=10, sd=2)
ggplot(data.frame(otterweight),
       aes(otterweight)) + geom_histogram()

otterweight = rnorm(2000, mean=10, sd=2)
ggplot(data.frame(otterweight),
       aes(otterweight)) + geom_histogram()

pick = sample(seq(2000, 2025), size=20,)

##########

encounters = rpois(n=1000, lambda=1)
ggplot(data.frame(encounters),
       aes(encounters)) + geom_histogram()

max(encounters)

############

#using R data
data(airquality) #load data
help(airquality) #learn about dataset
str(airquality) #see structure of data
attributes(airquality)

ggplot(airquality, aes(x=Temp, y=Ozone))+geom_point()+
  ggtitle("Ozone v. Temp")

ozone_sample=sample(airquality$Ozone, size=5, replace=F) #replace=F means I won't sample same thing again
ozone_sample

summary(airquality) #37 NAs, random sample will probably have some

airquality_clean = na.omit(airquality) #remove NAs

#Issue 2 - we can't link that Ozone with other measurements in the dataset
ozone_sample = sample(1:nrow(airquality_clean), size=5, replace=F) 
#above samples from row 1:nrow, giving info on ozone, wind, temp, day, etc.
ozone_sample
airquality_clean[ozone_sample,] #using sample as row index into airquality dataframe

#plot our sample days
ggplot(airquality_clean, aes(x=Temp, y=Ozone)) + geom_point() +
  geom_point(data=data.frame(Temp=airquality_clean$Temp[ozone_sample], 
                             Ozone=airquality_clean$Ozone[ozone_sample]),
             color="red", size=3) #adding just ozone points

########
# practice on my own
wind_sample=sample(airquality_clean$Wind, size=10, replace=F)
wind_sample

median(wind_sample)
median(airquality_clean$Wind)

#######

#create vector of possible fish
possible.fish = c("salmon", "steelhead", "shark", "tuna", "cod")

#we can use sample to simulate a random recording of catch

catch1 = base::sample(possible.fish, size=20, replace=T)
#bc possible.fish was a factor catch1 will be a factor

summary(catch1) #not informative

#if we want summary to be more useful, make this a factor
catch1=as.factor(catch1)

plot(catch1, col="blue")

mean(summary(catch1)) #summary works different with factors -> avg # fish in each species

max(summary(catch1)) #max frequency

#which fish was most frequently caught
which.max(summary(catch1))

#to get just the name of most frequently caught fish
names(which.max(summary(catch1)))

#######################

#simple example - use a loop to sum the numbers from 1-5
# a = 0+1+2+3+4+5

a=0
for (i in 1:5) {
  a = a+ i
}
a






