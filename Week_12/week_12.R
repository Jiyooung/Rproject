##### 12주차 : 데이터 시각화 2
# 1
install.packages("ggplot2")
library("ggplot2")

month <- c(1,2,3,4,5,6)
rain  <- c(55,50,45,50,60,70)
df <- data.frame(month,rain)           # 그래프를 작성할 대상 데이터
df

ggplot(df, aes(x=month,y=rain)) +      # 그래프를 그릴 데이터 지정
  geom_bar(stat="identity",            # 막대의 높이는 y축에 해당하는 열의 값  
           width=0.7,                  # 막대의 폭 지정
           fill="steelblue")           # 막대의 색 지정


ggplot(df, aes(x=month,y=rain)) +      # 그래프를 그릴 데이터 지정
  geom_bar(stat="identity",            # 막대 높이는 y축에 해당하는 열의 값  
           width=0.7,                  # 막대의 폭 지정
           fill="steelblue") +         # 막대의 색 지정
  ggtitle("월별 강수량") +             # 그래프의 제목 지정
  theme(plot.title = element_text(size=25, face="bold", colour="steelblue")) +
  labs(x="월",y="강수량") +            # 그래프의 x, y축 레이블 지정
  coord_flip()                         # 그래프를 가로 방향으로 출력

# 2
#library(ggplot2)

ggplot(iris, aes(x=Petal.Length)) +     # 그래프를 그릴 데이터 지정
  geom_histogram(binwidth=0.5)          # 히스토그램 작성 

# 3
#library(ggplot2)

ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species)) +
  geom_histogram(binwidth = 0.5, position="dodge") +
  theme(legend.position="top")

# 4
#library(ggplot2)

ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width)) + 
  geom_point()

# 5
#library(ggplot2)

ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width,
                      color=Species)) + 
  geom_point(size=3) +
  ggtitle("꽃잎의 길이와 폭") +              # 그래프의 제목 지정
  theme(plot.title = element_text(size=25, face="bold", colour="steelblue")) 

# 6
#library(ggplot2)

ggplot(data=iris, aes(y=Petal.Length)) + 
  geom_boxplot(fill="yellow") 

# 7
#library(ggplot2)

ggplot(data=iris, aes(y=Petal.Length, fill=Species)) + 
  geom_boxplot() 

# 8
#library(ggplot2)

year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year,cnt)              # 데이터 준비
head(df)

ggplot(data=df, aes(x=year,y=cnt)) +   # 선그래프 작성
  geom_line(col="red") 

# 9
#install.packages("Rtsne")
library("Rtsne")
#library("ggplot2")

ds <- iris[,-5]               # 품종 정보 제외

## 중복 데이터 제거
dup = which(duplicated(ds))
dup                           # 143번째 행 중복
ds <- ds[-dup,]
ds.y <- iris$Species[-dup]    # 중복을 제외한 품종 정보

## t-SNE 실행
tsne <- Rtsne(ds,dims=2, perplexity=10)

## 축소결과 시각화 
df.tsne <- data.frame(tsne$Y)
head(df.tsne)
ggplot(df.tsne, aes(x=X1, y=X2, color=ds.y)) + 
  geom_point(size=2) 

# 10
#install.packages(c("rgl", "car"))  # rgl은 R 4.0 이상 버전에서 가능
library("car")
library("rgl")
library("mgcv")
library("Rtsne")

tsne <- Rtsne(ds,dims=3, perplexity=10)
df.tsne <- data.frame(tsne$Y)
head(df.tsne)

# 회귀면이 포함된 3차원 산점도
scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3)

# 회귀면이 없는 3차원 산점도
points <- as.integer(ds.y)
color <- c('red','green','blue')
scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3,
          point.col = color[points],   # 점의 색을 품종별로 다르게 
          surface=FALSE)               # 회귀면을 표시하지 않음 
