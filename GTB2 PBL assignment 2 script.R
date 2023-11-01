#GTB2 PBL assignment 2 script

theme_set(theme_gray(base_family='NanumGothic'))

install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

#1.지하철역의 하루 평균 혼잡도

congestion1$day_mean <-rowMeans(congestion1[,c('s0530','s0600','s0630','s0700','s0730','s0800','s0830','s0900','s0930','s1000','s1030','s1100','s1130','s1200','s1230','s1300','s1330','s1400','s1430','s1500','s1530','s1600','s1630','s1700','s1730','s1800','s1830','s1900','s1930','s2000','s2030','s2100','s2130','s2200','s2230','s2300','s2330')])
mean(congestion1$day_mean)

#1.호선별 하루 평균 혼잡도
line_1_mean <- mean(congestion1$day_mean[congestion1$line == 1])
line_1_mean
line_2_mean <- mean(congestion1$day_mean[congestion1$line == 2])
line_2_mean
line_3_mean <- mean(congestion1$day_mean[congestion1$line == 3])
line_3_mean
line_4_mean <- mean(congestion1$day_mean[congestion1$line == 4])
line_4_mean
line_5_mean <- mean(congestion1$day_mean[congestion1$line == 5])
line_5_mean
line_6_mean <- mean(congestion1$day_mean[congestion1$line == 6])
line_6_mean
line_7_mean <- mean(congestion1$day_mean[congestion1$line == 7])
line_7_mean
line_8_mean <- mean(congestion1$day_mean[congestion1$line == 8])
line_8_mean

#지하철 출근 시간대의 평균 혼잡도 

s0700_line <- congestion1[, c('s0700', 'line')]
result0700 <- s0700_line %>% 
  group_by(line) %>% 
  summarise(mean_s0700 = mean(s0700, na.rm = TRUE))
result0700

s0730_line <- congestion1[, c('s0730', 'line')]
result0730 <- s0730_line %>% 
  group_by(line) %>% 
  summarise(mean_s0730 = mean(s0730, na.rm = TRUE))
result0730

s0800_line <- congestion1[, c('s0800', 'line')]
result0800 <- s0800_line %>% 
  group_by(line) %>% 
  summarise(mean_s0800 = mean(s0800, na.rm = TRUE))
result0800

s0830_line <- congestion1[, c('s0830', 'line')]
result0830 <- s0830_line %>% 
  group_by(line) %>% 
  summarise(mean_s0830 = mean(s0830, na.rm = TRUE))
result0830

s0900_line <- congestion1[, c('s0900', 'line')]
result0900 <- s0900_line %>% 
  group_by(line) %>% 
  summarise(mean_s0900 = mean(s0900, na.rm = TRUE))
result0900

#기술통계분석

summary(s0700_line)
summary(s0730_line)
summary(s0800_line)
summary(s0830_line)
summary(s0900_line)

#평균혼잡도가 가장 높은 시간대 막대그래프 = 8시 

ggplot(data = result0800, aes(x = factor(line), y = mean_s0800)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(x = "호선", y = "혼잡도") +
  ggtitle("0800 시간대의 혼잡도") +
  theme_minimal()

#평균혼잡도 상위 4개 호선 역별 기여도



#지하철 퇴근 시간대의 평균 혼잡도 

s1800_line <- congestion1[, c('s1800', 'line')]
result1800 <- s1800_line %>% 
  group_by(line) %>% 
  summarise(mean_s1800 = mean(s1800, na.rm = TRUE))
result1800

s1830_line <- congestion1[, c('s1830', 'line')]
result1830 <- s1830_line %>% 
  group_by(line) %>% 
  summarise(mean_s1830 = mean(s1830, na.rm = TRUE))
result1830

s1900_line <- congestion1[, c('s1900', 'line')]
result1900 <- s1900_line %>% 
  group_by(line) %>% 
  summarise(mean_s1900 = mean(s1900, na.rm = TRUE))
result1900

s1930_line <- congestion1[, c('s1930', 'line')]
result1930 <- s1930_line %>% 
  group_by(line) %>% 
  summarise(mean_s1930 = mean(s1930, na.rm = TRUE))
result1930

s2000_line <- congestion1[, c('s2000', 'line')]
result2000 <- s2000_line %>% 
  group_by(line) %>% 
  summarise(mean_s2000 = mean(s2000, na.rm = TRUE))
result2000

#기술통계분석

summary(s1800_line)
summary(s1830_line)
summary(s1900_line)
summary(s1930_line)
summary(s2000_line)

#평균혼잡도가 가장 높은 시간대 막대그래프 = 18시  

ggplot(data = result1800, aes(x = factor(line), y = mean_s1800)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(x = "호선", y = "혼잡도") +
  ggtitle("1800 시간대의 혼잡도") +
  theme_minimal()

#평균혼잡도 상위 4개 호선 역별 기여도

# 출발시간 8시의 지하철 혼잡도 범주화/범주별 빈도분석

congestion1 %>%
  mutate(s80_grade=ifelse(s0800<=80, "good", ifelse(s0800<=130, "normal", ifelse(s0800<=150, "caution","bad"))))%>%
  group_by(s80_grade) %>%
  summarise(n=n())%>%mutate(total=sum(n), pct=round(n/total*100,1))%>%
  select(s80_grade,n,pct)%>%
  arrange(desc(n))

#출발시간 18시의 지하철 혼잡도 범주화/범주별 빈도분석

congestion1 %>%
  mutate(s80_grade=ifelse(s1800<=80, "good", ifelse(s1800<=130, "normal", ifelse(s1800<=150, "caution","bad"))))%>%
  group_by(s80_grade) %>%
  summarise(n=n())%>%mutate(total=sum(n), pct=round(n/total*100,1))%>%
  select(s80_grade,n,pct)%>%
  arrange(desc(n))
