combinations<-read.csv("Combinations.csv")
combinations2<-subset(combinations, gut.passed.prop.germ==graph)
combinations3<-subset(combinations2, gut.passed.prop.germ==NA )
library(metafor)
practice<-read.csv("Metafor practice.csv")
practice2 <- escalc(measure="RR", ai=gut.passed.prop.germ, ci=comparison.prop.germ, data=practice)
rma(practice$gut.passed.prop.germ, practice$comparison.prop.germ, data = practice)

practice3<-read.csv("Meta2.csv")
practice4 <- escalc(measure="RR", ai=gut.passed.prop.germ, bi=no.germ, ci=comparison.prop.germ, di=no.germ.1, data=practice3)
practice5 <- rma(yi, vi, data=practice4, method="EB")
practice5
practice6 <- rma(yi, vi, data=practice4, method="FE")
practice6



