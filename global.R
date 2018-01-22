#The global file

library(ggplot2)
library(plotly)


#The original data has observations from 1955 to 2011 (years); 
#however, this app only used aggregated observations from 1996 to 2011. 
#This decision is based on using a higher quality and complete 
#data set compared to previous data and more efficient in reading data (aggregated).
#See the process of cleaning and preparing data: http://rpubs.com/jiprave/project2_exploring-data


Z<-read.csv("data/data_agregated.csv", header = T, sep=",")
descri0<-c("total of fatality events by year","total of injury events by year",
          "total economic damage to property by year (in million of dollars)",
          "total economic damage to crops by year (in million of dollars)",
          "mean of fatalities by event",
          "mean of injuries by event",
          "mean of economic damage to property by event (in million of dollars)",
          "mean of economic damage to crops by event (in million of dollars)")


#Function for graphs
my.plot.top<-function(g, my.variab, horiz, colorin)
{
    
  
    q<-g+ geom_bar(stat = "identity", fill=colorin) +
    guides(fill = FALSE)+ 
    geom_text(size = 5, position=position_identity(), hjust=0.7)+
    theme_bw() + xlab("") +
    ylab(my.variab)+labs(title = my.variab)
    
    if (horiz==T){
    
          q<-q+coord_flip()
       
   }
       
       q
    
    
}

