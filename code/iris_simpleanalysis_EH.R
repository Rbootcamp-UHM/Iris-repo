##################################################
#         Gotta set up that WD (pc only)         #
##################################################

#setwd("C:/Users/hille/Documents/Rbootcamp_S2020/Iris-repo/")

##################################################
#                   Housekeeping                 #
##################################################

#This mixes the data and then assigns IRIS to read it in the mixed order 
#Then stores the mixed data as an object
oo <- sample(x=1:150, 150, replace=FALSE)
mix <- iris[oo,]

#Creates and stores "mix$" as seperate objects
species <- mix$Species
petalL <- mix$Petal.Length
petalW <- mix$Petal.Width
sepalL <- mix$Sepal.Length
sepalW <- mix$Sepal.Width


#This matches each species with their respective colors
species
color <- rep("red", 150)
species == "setosa"
color[species == "setosa"] <- "purple"
color
color[species == "versicolor"] <- "blue"
color
color[species == "virginica"] <- "orange"
color

##################################################
#                2-D Scatter plots               #
##################################################

#Here are the setups for the linear regressions for each of the comparisons I have made
petalW.lm <- lm(petalW ~ petalL)
sepalL.lm <- lm(sepalL ~ petalL)
sepalW.lm <- lm(sepalW ~ petalL)

#This indexes the iris dataset by species and should make regression lines for each species
setosa <- mix[mix$Species == "setosa",]
setosa
setosaPLvsSW.lm <- lm(setosa$Sepal.Width ~ setosa$Petal.Length)
setosaPLvsSW.lm

versicolor <- mix[mix$Species == "versicolor",]
versicolor
versicolorPLvsSW.lm <- lm(versicolor$Sepal.Width ~ versicolor$Petal.Length)
versicolorPLvsSW.lm


virginica <- mix[mix$Species == "virginica",]
virginica
virginicaPLvsSW.lm <- lm(virginica$Sepal.Width ~ virginica$Petal.Length)
virginicaPLvsSW.lm


#Here are the plots

#This is the plot with the regression line for ALL OF THE DATA
plot(petalL, sepalW, col=color, cex=1.5, pch=19, xlab="Petal Length", ylab="Sepal Width")
abline(sepalW.lm, col="black")
legend('topright', legend = levels(species), col = c("purple", "blue", "orange"), cex = 1, pch = 19)

#This is the plot with a regression line for EACH SPECIES
plot(petalL, sepalW, col=color, cex=1.5, pch=19, xlab="Petal Length", ylab="Sepal Width")
abline(setosaPLvsSW.lm, col="purple")
abline(versicolorPLvsSW.lm, col="blue")
abline(virginicaPLvsSW.lm, col="orange")
legend('topright', legend = levels(species), col = c("purple", "blue", "orange"), cex = 1, pch = 19)


##################################################
#    Generating RMakrdown on Ethan's Computer    #
##################################################

#This is needed to set up and use "RMarkdown"
require("rmarkdown")
#Sys.setenv(RSTUDIO_PANDOC="C:/Program Files/RStudio/bin/pandoc")
render("iris_markdown_EH.Rmd", "html_document")


##################################################
#             Below are extra notes              #
##################################################

#This works with the dataset in order
#species <- iris$Species
#color <- rep("red", 150)
#species == "setosa"
#color[species == "setosa"] <- "purple"
#color
#color[species == "versicolor"] <- "blue"
#color
#color[species == "virginica"] <- "green"
#color

#Here are some extra comparisons
#plot(petalL, petalW, cex=1.5, pch=19, col=color2, xlab = "Petal Length", ylab = "Petal Width")
#abline(petalW.lm, col="black")
#legend('bottomright', legend = levels(species), col = c("purple", "blue", "orange"), cex = 1, pch = 19)

#plot(petalL, sepalL, col=color2, cex=1.5, pch=19, xlab = "Petal Length", ylab = "Sepal Length")
#abline(sepalL.lm, col="black")
#legend('bottomright', legend = levels(species), col = c("purple", "blue", "orange"), cex = 1, pch = 19)

#plot(petalL, sepalW, col=color2, cex=1.5, pch=19, xlab="Petal Length", ylab="Sepal Width")
#abline(setosaPLvsSW.lm, col="purple")
#	points(setosa$Petal.Length, yhat.setosa, pch=5)
#	segments(setosa$Petal.Length, setosa$Sepal.Width, setosa$Petal.Length, yhat.setosa, names=error.setosa.sepalW)
#abline(versicolorPLvsSW.lm, col="blue")
#abline(virginicaPLvsSW.lm, col="orange")
#legend('topright', legend = levels(species), col = c("purple", "blue", "orange"), cex = 1, pch = 19)

#b.setosa <- coef(setosaPLvsSW.lm)
#int.setosa <- b.setosa[1]
#slope.setosa <- b.setosa[2]
#yhat.setosa <- slope.setosa*setosa$Petal.Length+int.setosa
#yhat.setosa
#error.setosa.sepalW <- setosa$Sepal.Width-yhat.setosa
#error.setosa.sepalW

#b.versicolor <- coef(versicolorPLvsSW.lm)
#int.versicolor <- b.versicolor[1]
#slope.versicolor <- b.versicolor[2]
#yhat.versicolor <- slope.versicolor*versicolor$Petal.Length+int.versicolor
#yhat.versicolor
#error.versicolor.sepalW <- versicolor$Sepal.Width-yhat.versicolor
#error.versicolor.sepalW

#b.virginica <- coef(virginicaPLvsSW.lm)
#int.virginica <- b.virginica[1]
#slope.virginica <- b.virginica[2]
#yhat.virginica <- slope.virginica*virginica$Petal.Length+int.virginica
#yhat.virginica
#error.virginica.sepalW <- virginica$Sepal.Width-yhat.virginica
#error.virginica.sepalW