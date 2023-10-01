#this is week4 assignment 

#도수분포표
table(STB $Gender)

#상대도수분포표 
GEN<-table(STB$Gender)
prop.table(GEN)

#교차표 만들기
table(STB$Gender, STB$Grade)

#막대그래프
barplot(table(STB$Nationality),xlab ="Nationality (3=Mongolia, 4=China, 5=South Korea)")

#가로막대그래프
barplot(table(STB$`residential area`),horiz=TRUE)

#파이그래프
pie(table(STB$Gender))

#히스토그램
hist(STB$Age,main="Age")

# 박스 플롯
boxplot(STB$Grade,STB$Age, col="pink", xlab ="Grade",ylab= "Age")

#산점도
plot(x=STB$Grade,y=STB$Age,xlab="grade", ylab="age",main="Grade and Age")