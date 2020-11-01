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
diff(range(diamonds$price)) ## 18497 ( 18823 - 326 = 18497 )

# (3) 분포의 모양