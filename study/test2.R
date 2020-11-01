install.packages("tidyverse")
install.packages("e1071") # 왜도, 첨도 
install.packages("plotly")
library(tidyverse)
library(e1071)
library(plotly)

# 예제 데이터 : ggplot2::diamonds
# 양적 자료 : price

# 일변량 양적 자료의 분석
# 1. 표 = 빈도표
# (1) 구간의 빈도 

mean(diamonds$price)

x1 <- c(10, 20, 30, NA)

# 일반 평균
mean(x1)
mean(x1, na.rm = TRUE)

# 절사 평균
mean(diamonds$price, trim = 0.05, na.rm = TRUE  )
mean(diamonds$price, trim = 0.10, na.rm = TRUE  )

# 중위수
median(diamonds$price, na.rm = TRUE)

# 최빈수 
table(diamonds$price)
which.max(table(diamonds$price)) # 605, 261 : 261 번째 있는 605 값을 의미 


# 분포 모양
# 1. 왜도 (Skewness)
# 대칭 여부 알려 주는값
# e1071::skewness(data$variable)
e1071::skewness(diamonds$price) # 1.618305  왜도가 0 보다 큰 비대칭 ( 우측 큰 값이 이상치 인 경우)

# 첨도
# 중심이 얼마나 뾰죡 한가 알려 주는 값
# e1071::kurtosis(data$variable)
e1071::kurtosis(diamonds$price) # 2.177 첨도가 0보다 큰값 이면

# 기타
# 최소값 
min(diamonds$price) # 326

# 최대값
max(diamonds$price)  # 18823


rnorm(n = 10)
set.seed(100)

d1 <- rnorm(n = 10, mean = 170, sd = 10)

# 모평균 170, 모표준편자 10, 정규분포 


# 170 이하는
pnorm(170, mean = 170, sd = 10)
# 190 이하는
1- pnorm(190, mean = 170, sd = 10)
pnorm(190, mean = 170, sd = 10, lower.tail = FALSE) # 190 보타 큰값을 달라는 의미
# 140 ~ 200 
pnorm(200, mean = 170, sd = 10) - pnorm(140, mean = 170, sd = 10)


# 확률 변수 구하기
qnorm(0.95, mean = 170, sd = 10)

# 밀도 구하기 : 특정 구간에 데이터가 어느 정도마 몰려 있는지 
dnorm(170, mean = 170, sd = 10)  # 0.039  ( 170 구간에 데이터가 3.9% 몰려 있다는 의미)
