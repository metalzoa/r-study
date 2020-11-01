install.packages("tidyverse")
install.packages("e1071") # 왜도, 첨도 
install.packages("plotly")
library(tidyverse)
library(e1071)
library(plotly)

# 예제 데이터 : ggplot::diamonds
# 양적 자료 : price

# 기술 통계량 = 요약 통계량 
# (1) 중심 : 대표값 
# (2) 퍼짐 : 산포 = 다름
# i. 범위 (Range), ragne 를 사용 하는 이유는 이곳에서 최대와 최소 값을 구해줌
# diff(range(data$variable))
range(diamonds$price) # 326, 18823 
diff(range(diamonds$price)) ## 18497 ( 18823 - 326 = 18497 ) , 범위를 구하는 방법을 의미
diff(c(3, 10, 5)) # 7, -5 : 10 -3 = 7, 5 - 10 =  -5 , 시계열 데이터에서 최근 데이터를 과거의 데이터로 뺴면서 변화 추이를 볼때 사용

# ii. 사분위 범위 = 사분위수범위 (IQR : inter, Quartile range)
# IRQ(data$variable)
IQR(diamonds$price) # 4374.25 : 위에서 구한 일반 범위값 18497 와 4374.25 차이가 크게 남을 확인, 이것이 의미 하는건 이상치(매우작거나, 매우큰값이) 가 있다는것을 의미
                    # 그러므로 위에서 구한 범위는 사용 하기가 적절 하지 않다는 것을 의미이고, 사분위 범위를 사용하는 것이 적절함을 의미

# iii. 분산(variance) : 표분의 분산
# var(data$variable, na.rm = TRUE) # 미싱 벨류 빼고 분산을 구하라는 의미, 이 단계 에서 분산을 구하는것 적절 하지 않다고함, 그래서 표준 편차를 먼저 구하자고함
var(diamonds$price) # 15915629 : 값이 크면 평균과 차이가 많이난다고 볼수 있지만 , price(달러) 가 아닌 달려제곱값 이므로 적절 하지 않다

# iv. 표준편차 (SD : standard deviation) : 표본의 표준 편차
# 평균과 얼마나 다를까를 의미
# sd(data$variable, na.rm = TRUE)
sd(diamonds$price, na.rm = TRUE) # 3989.44, 보지 못한 데이터 들이 평균과 이정도 차이가 남을 의미

# 분산 표준편차 이런값을은 이상치에 영향을 많이 받기 때문에 중위수절대 편차를 사용 
# v. 중위수 절대 편차 (MAD : median absolute deviation)
# 중위수와 얼마나 다를까를 의미
# mad(data$variable, na.rm = TRUE)
mad(diamonds$price, na.rm = TRUE) # 2475.942,  중위수가 2400 정도 되는데 2475.942 가 의미 하는건 중위수 2400 과 약 2475.942 차이가 나고 있음을 의미 , 
                                  # ? 중위수 2400은 어디서 구한거지?? 설명이 없네.. 하지만 위에서 구한 표준편차 3989.44 보다 작기 때문에 이값이 더 좋은값
                                  # 그래서 중심(평균값은) 중위수로 해석 하는것이 바람직 함을 의미
                                  # 다름 , 퍼짐, 산포 요부분은 표준 편차 보다 중위수 절대 편차로 해석 하는게 더 적함함을 의미

# (3) 분포의 모양
