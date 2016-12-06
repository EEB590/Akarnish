####Data cleaning script for Animal list, plant list, and Plant-frugivore combinations list

setwd("~/EBL GUT PASSAGE/Data/Raw Data")

library(tidyr)
library(dplyr)
library(plyr)

####Cleaing of Animal list####
animal<-read.csv("Gut passage papers - Animal list.csv")

write.csv(animal, "tidyAnimalList")
####Cleaning of plant list#####
plantlist<-read.csv("Gut passage papers - Plant List.csv")

write.csv(plantlist, "tidyPlantList")
####Cleaning of Plant-Frugivore Combinations####
combinations<-read.csv("Gut passage papers - Plant-Frugivore Combinations.csv")

levels(as.factor(combinations$frug.taxon))

combinations$frug.taxon<-as.factor(tolower(combinations$frug.taxon))

levels(as.factor(combinations$frug.taxon))

combinations$frug.taxon<- gsub("non-flying mammal other than primate", "non-flying mammal",combinations$frug.taxon)

levels(as.factor(combinations$frug.taxon))

combinations$frug.taxon<- gsub("non-flying mammal", "non-flying mammal other than primate",combinations$frug.taxon)

levels(as.factor(combinations$frug.taxon))

combinations$frug.taxon<- gsub("gastropod", "invertebrate", combinations$frug.taxon)
###Cleaning germ. effect####

levels(as.factor(combinations$germ.effect..pos..neg..no..NA.))

combinations$germ.effect..pos..neg..no..NA.<- gsub("neg'", "neg", combinations$germ.effect..pos..neg..no..NA.)

combinations$germ.effect..pos..neg..no..NA.<- gsub("no ","no", combinations$germ.effect..pos..neg..no..NA.)

levels(as.factor(combinations$germ.effect..pos..neg..no..NA.))


###Cleaning rate.effect###

levels(as.factor(combinations$rate.effect..pos..neg..no..NA.))

combinations$rate.effect..pos..neg..no..NA.<- gsub("likely not","no", combinations$rate.effect..pos..neg..no..NA.)

combinations$rate.effect..pos..neg..no..NA.<- gsub("no ","no", combinations$rate.effect..pos..neg..no..NA.)

combinations$rate.effect..pos..neg..no..NA.<- gsub("neg ","neg", combinations$rate.effect..pos..neg..no..NA.)

combinations$rate.effect..pos..neg..no..NA.<- gsub("pos ","pos", combinations$rate.effect..pos..neg..no..NA.)

combinations$rate.effect..pos..neg..no..NA.<- gsub("likely pos","pos", combinations$rate.effect..pos..neg..no..NA.)

levels(as.factor(combinations$rate.effect..pos..neg..no..NA.))

###Cleaning compared against###

levels(as.factor(combinations$compare.against))

combinations$compare.against<- gsub("depulped","mechanically cleaned fruit", combinations$compare.against)

combinations$compare.against<- gsub("depulp","mechanically cleaned fruit", combinations$compare.against)

combinations$compare.against<- gsub("mechanically cleanded fruit","mechanically cleaned fruit", combinations$compare.against)

combinations$compare.against<- gsub("mechanicaly cleanded fruit","mechanically cleaned fruit", combinations$compare.against)

combinations$compare.against<- gsub("mechanicaly","mechanically", combinations$compare.against)

combinations$compare.against<- gsub("intact seeds","mechanically cleaned", combinations$compare.against)

combinations$compare.against<- gsub("fruits","fruit", combinations$compare.against)

combinations$compare.against<- gsub("wnole","whole", combinations$compare.against)

combinations$compare.against<- gsub("intact fruit","whole fruit", combinations$compare.against)

combinations$compare.against<- gsub("other (acid treated seed)", "acid treated seed", combinations$compare.against)

combinations$compare.against<- gsub("[][!#$%()*,.:;<=>@^_`|~.{}]", "", combinations$compare.against)

combinations$compare.against<- gsub("other ", "", combinations$compare.against)

combinations$compare.against<- gsub("mechanically cleaned fruit ", "mechanically cleaned fruit", combinations$compare.against)

combinations$compare.against<- gsub("fruitand", "fruit and", combinations$compare.against)

combinations$compare.against<- gsub("fruitseed", "fruit seed", combinations$compare.against)

levels(as.factor(combinations$compare.against))

###Changed "X" column to "numid" so the different databases could merge###

colnames(combinations)[colnames(combinations)=="X"] <- "numid"

write.csv(combinations, "tidyPlant-FrugivoreCombinations")

###Cleaning Gut passage papers - Papers.csv####

allpapers<-read.csv("Gut passage papers - Papers.csv")

###Cleaning numeric.effect####

levels(as.factor(allpapers$numeric.effect.size.calculable.))

allpapers$numeric.effect.size.calculable.<- gsub("meand","mean", allpapers$numeric.effect.size.calculable.)

allpapers$numeric.effect.size.calculable.<- gsub("mean ","mean", allpapers$numeric.effect.size.calculable.)

allpapers$numeric.effect.size.calculable.<- gsub("meanand","mean and", allpapers$numeric.effect.size.calculable.)




###Cleaning compares.gut.pass###

levels(as.factor(allpapers$Compares.gut.passed.against.what.))

allpapers$Compares.gut.passed.against.what.<- gsub("depulp", "mechanically cleaned fruit", allpapers$Compares.gut.passed.against.what.)

allpapers$Compares.gut.passed.against.what.<- gsub("other ", "", allpapers$Compares.gut.passed.against.what.)

allpapers$Compares.gut.passed.against.what.<- gsub("[][!#$%()*.:;<=>@^_`|~.{}]", "", allpapers$Compares.gut.passed.against.what.)

allpapers$Compares.gut.passed.against.what.<- gsub("cleand", "cleaned", allpapers$Compares.gut.passed.against.what.)


###Cleaning germ.trial###
levels(as.factor(allpapers$germtrial))


###Cleaning feeding trial####k
levels(as.factor(allpapers$feedtrial))


###Cleaning long region####
levels(as.factor(allpapers$longregion))


###Cleaning region2####
levels(as.factor(allpapers$region2))

allpapers$region2<- gsub("* spp from both", "", allpapers$region2)

allpapers$region2<- gsub("[][!#$%()*,.:;<=>@^_`|~.{}]", "", allpapers$region2)

###Cleaning mainisland####
levels(as.factor(allpapers$mainisland))

###making csv for Papers###

write.csv(allpapers, "tidyPapers")
