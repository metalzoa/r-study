install.packages("ggplot2")
library(ggplot2)

# ggplot2::diamonds
# 질적 자료 : cut, color, clarity

# table(data$variable)

table(diamonds$cut)

# sort(frequency, descreasing = TRUE)

sort(table(diamonds$cut), decreasing = TRUE)

# 백분율 구하기 
# prop.table(frequency)*100

prop.table(table(diamonds$cut))*100
sort(prop.table(table(diamonds$cut))*100, decreasing = TRUE)

# 백분율의 소수점 자리수는 1자리 까지만 표현함
# round(percent, digits = 1)

round(sort(prop.table(table(diamonds$cut))*100, decreasing = TRUE), digits = 1)
