# Various R plots and graphs for a Data Analysis course
# EJR
#
# Notes
# > RStudio has several useful cheatsheets, accessed via the Help menu
# > R uses  <-  as an expression for assignment, but  =  also works


# 1. Dot plot 
#  Use guinea pig tooth growth data
#  Source
#  C. I. Bliss (1952) The Statistics of Bioassay. Academic Press.
#  http://www.sthda.com/english/wiki/ggplot2-dot-plot-quick-start-guide-r-software-and-data-visualization

# Make use of the Toothgrowth sample data in the R distribution
# Convert the variable dose from a numeric to a factor variable, so that the x-position of the dose quantities are uniformly spaced (and not at x={0.5,1,2} ).
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
head(ToothGrowth)

library(ggplot2)
# Basic dot plot
p<-ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_dotplot(binaxis='y', stackdir='center')
p

# Change dotsize and stack ratio
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_dotplot(binaxis='y', stackdir='center',
               stackratio=1.5, dotsize=1.2)
# Rotate the dot plot
p + coord_flip()

 
# Add mean and median points
# dot plot with mean points
p + stat_summary(fun.y=mean, geom="point", shape=18,
                 size=3, color="red")
# dot plot with median points
p + stat_summary(fun.y=median, geom="point", shape=18,
                 size=3, color="red")


# %
# Dot plot with box plot and violin plot
# Add basic box plot
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_boxplot()+
  geom_dotplot(binaxis='y', stackdir='center')
# Add notched box plot
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_boxplot(notch = TRUE)+
  geom_dotplot(binaxis='y', stackdir='center')
# Add violin plot
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_violin(trim = FALSE)+
  geom_dotplot(binaxis='y', stackdir='center')

# compare with scatterplot
ggplot(ToothGrowth, aes(x=dose, y=len)) + geom_point()


# Use single fill color, and label axes
ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_dotplot(binaxis='y', stackdir='center', fill="#FFAAD4")
# Change dot plot colors by groups
p<-ggplot(ToothGrowth, aes(x=dose, y=len, fill=dose)) +
  geom_dotplot(binaxis='y', stackdir='center') + 
  labs(title="Plot of length  by dose",x="Dose (mg)", y = "Length")
p + coord_flip()



# 2. Bar charts
# Note this is commented out as it doesn't currently work for me
# There were problems (virus-checker?) installing this from:
# http://www.sthda.com/english/wiki/wiki.php?title=ggplot2-histogram-easy-histogram-graph-with-ggplot2-r-package
#   library(ggplot2)
#   ggplot2.histogram(data=weight, xName='weight', groupName='sex',
#                  legendPosition="top",
#                  groupColors=c('#999999','#E69F00'), alpha=0.5 )

# 3. Scatter plots
# Try miles per gallon data:
# http://www.sthda.com/english/wiki/ggplot2-scatter-plots-quick-start-guide-r-software-and-data-visualization

# Convert cyl column from a numeric to a factor variable
mtcars$cyl <- as.factor(mtcars$cyl)
head(mtcars)
library(ggplot2)

# Basic scatter plot, for all cars
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
# Change the point size, and shape
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(size=2, shape=23)+
  labs(title="Miles per gallon \n according to the weight",
       x="Weight (lb/1000)", y = "Miles/(US) gallon")

# Add regression lines
ggplot(mtcars, aes(x=wt, y=mpg, color=cyl, shape=cyl)) +
  geom_point() + 
  geom_smooth(method=lm) + 
  labs(title="Miles per gallon \n according to vehicle weight",
       x="Weight (lb/1000)", y = "Miles/(US) gallon")

# Add colours but not regression lines
ggplot(mtcars, aes(x=wt, y=mpg, color=cyl, shape=cyl))  +
  geom_point() + 
  labs(title="Miles per gallon \n according to vehicle weight",
       x="Weight (lb/1000)", y = "Miles/(US) gallon")


# 3A) Amiloride data
v_vehicle <- c(2.925,4.190,5.067,2.588,3.934,3.952,2.547,4.108,2.646,3.635,2.890,3.125,3.805,1.741)
v_amil    <- c(2.760,4.490,5.517,2.543,3.910,3.985,2.392,3.880,2.732,3.758,2.960,3.387,4.048,1.787)
a = v_vehicle;v_amil
dd=data.frame(v_vehicle,v_amil)

ggplot(dd, aes(x=v_vehicle, y=v_amil)) +
  geom_point(size=2, shape=23)+
  labs(title="Forced vital capacity (FCV)",
       x="FVC (litres), vehicle", y = "FVC (litres), amiloride")+
  geom_abline(intercept = 0)


# 4. 






















ToothGrowth$dose <- as.factor(ToothGrowth$dose)
head(ToothGrowth)

library(ggplot2)
# Basic dot plot
p<-ggplot(ToothGrowth, aes(x=dose, y=len)) + 
  geom_dotplot(binaxis='y', stackdir='center')
p


