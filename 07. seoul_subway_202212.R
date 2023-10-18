#hi

install.packages("dplyr") 
install.packages("ggplot2") 
library(dplyr) 
library(ggplot2)

str(subway)

summary(subway)

#파생변수1.정수형day변수
subway$day <-substr(subway$Date,7,8)
class(subway$day)
subway$day <-as.integer(subway$day)

#파생변수2.line변수
table(subway$Line)

subway$Line <-ifelse(subway$Line=="9호선2~3단계","9호선",subway$Line)

table(subway$Station)

subway$total_passenger <-subway$on_board+subway$getting_off

str(subway)

subway%>%summarise(on_m=mean(on_board), off_m=mean(getting_off))

max(subway$on_board)