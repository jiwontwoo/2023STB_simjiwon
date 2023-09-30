#this is week4 assignment 

#도수분포표
table(STB $Gender)

#상대도수분포표 
GEN<-table(STB$Gender)
prop.table(GEN)

#교차표 만들기
table(STB$Gender, STB$Grade)

#막대그래프
barplot(table(STB$Nationality))