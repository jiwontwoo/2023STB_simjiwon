#this is week4 assignment 

#step2 도수분포표
table(STB $Gender)

#step3 상대도수분포표 
GEN<-table(STB$Gender)
prop.table(GEN)

#step4 교차표 만들기
table(STB$Gender, STB$Grade)

#step5 막대그래프
barplot(table(STB$Nationality),xlab ="Nationality (3=Mongolia, 4=China, 5=South Korea)")

#step6 가로막대그래프
barplot(table(STB$`residential area`),horiz=TRUE,main='Nesidential Area',ylab='6=경기,7=대구,8=서울, 9=울산, 10=인천, 11=충북')

#step7 막대그래프 
barplot(table(STB$Gender,STB$Grade),legend=TRUE,xlab='Grade(1=male, 2=female)')

#step8 파이그래프
pie(table(STB$Gender),main='Gender (1=male, 2=female)')

#step9 히스토그램
hist(STB$Age,main="Age")

#step10 박스 플롯
boxplot(STB$Grade,STB$Age, col="pink")

#step10 기술통계
summary(STB)

#step11 산점도
plot(x=STB$Grade,y=STB$Age,xlab="grade", ylab="age",main="Grade and Age")