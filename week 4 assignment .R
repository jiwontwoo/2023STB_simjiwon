#this is week4 assignment 

#도수분포표
table(STB $Gender)

#상대도수분포표 
GEN<-table(STB$Gender)
prop.table(GEN)