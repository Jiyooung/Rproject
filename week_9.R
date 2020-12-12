##### 9주차

wt <-mtcars$wt                   # 중량 자료
mpg <- mtcars$mpg                # 연비 자료
plot(wt, mpg,                    # 2개 변수(x축, y축)     
     main="중량-연비 그래프",    # 제목
     xlab="중량",                # x축 레이블
     ylab="연비(MPG)",           # y축 레이블
     col="red",                  # point의 color
     pch=19)                     # point의 종류 


vars <- c("mpg","disp","drat","wt")    # 대상 변수 
target <- mtcars[,vars]
head(target)
pairs(target,                          # 대상 데이터     
      main="Multi Plots") 

iris.2 <- iris[,3:4]                # 데이터 준비
point <- as.numeric(iris$Species)   # 점의 모양
point                               # point 내용 출력
color <- c("red","green","blue")    # 점의 컬러
plot(iris.2, 
     main="Iris plot",
     pch=c(point),
     col=color[point]) 


beers = c(5,2,9,8,3,7,3,5,3,5)                 # 자료 입력
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,  # 자료 입력
         0.06,0.02,0.05)
tbl <- data.frame(beers,bal)                   # 데이터프레임 생성
tbl                                
plot(bal~beers,data=tbl)                       # 산점도 
res <- lm(bal~beers,data=tbl)                  # 회귀식 도출
abline(res)                                    # 회귀선 그리기
cor(beers,bal)                                 # 상관계수 계산


cor(iris[,1:4])                   # 4개 변수 간 상관성 분석


month = 1:12                             # 자료 입력
late  = c(5,8,7,9,4,6,12,13,8,6,6,4)     # 자료 입력      
plot(month,                              # x data
     late,                               # y data
     main="지각생 통계",                 # 제목 
     type= "l",                          # 그래프의 종류 선택(알파벳) 
     lty=1,                              # 선의 종류(line type) 선택
     lwd=1,                              # 선의 굵기 선택
     xlab="Month",                       # x축 레이블
     ylab="Late cnt"                     # y축 레이블
)


month = 1:12
late1  = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2  = c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month,                                # x data
     late1,                                # y data
     main="Late Students",
     type= "b",                            # 그래프의 종류 선택(알파벳) 
     lty=1,                                # 선의 종류(line type) 선택
     col="red",                            # 선의 색깔 선택          
     xlab="Month ",                        # x축 레이블
     ylab="Late cnt",                      # y축 레이블
     ylim=c(1, 15)                         # y축 값의 (하한, 상한)
)
lines(month,                               # x data
      late2,                               # y data
      type = "b",                          # 선의 종류(line type) 선택
      col = "blue")                        # 선의 색깔 선택


## (1) Prepare Data ----------------------
library(mlbench)
data("BostonHousing")
myds <- BostonHousing[,c("crim","rm","dis","tax","medv")]

## (2) Add new column ----------------------
grp <- c()
for (i in 1:nrow(myds)) {                   # myds$medv 값에 따라 그룹 분류
  if (myds$medv[i] >= 25.0) {
    grp[i] <- "H"
  } else if (myds$medv[i] <= 17.0) {
    grp[i] <- "L"
  } else {
    grp[i] <- "M"
  }
}
grp <- factor(grp)                          # 문자벡터를 팩터 타입으로 변경
grp <- factor(grp, levels=c("H","M","L"))   # 레벨의 순서를 H,L,M -> H,M,L

myds <- data.frame(myds, grp)               # myds 에 grp 컬럼추가

## (3) Add new column ----------------------
str(myds)  
head(myds)
table(myds$grp)                             # 주택 가격 그룹별 분포

## (4) histogram ----------------------
par(mfrow=c(2,3))                           # 2x3 가상화면 분할
for(i in 1:5) {
  hist(myds[,i], main=colnames(myds)[i], col="yellow")
}
par(mfrow=c(1,1))                           # 2x3 가상화면 분할 해제


## (5) boxplot ----------------------
par(mfrow=c(2,3))                           # 2x3 가상화면 분할
for(i in 1:5) {
  boxplot(myds[,i], main=colnames(myds)[i])
}
par(mfrow=c(1,1))                           # 2x3 가상화면 분할 해제

## (6) boxplot by group ------------------
boxplot(myds$crim~myds$grp, main="1인당 범죄율")
boxplot(myds$rm~myds$grp, main="방의  수")
boxplot(myds$dis~myds$grp, main="직업센터까지의 거리")
boxplot(myds$tax~myds$grp, main="제산세")

## (7) scatter plot ------------------
pairs(myds[,-6])

## (8) scatter plot with group ------------------
point <- as.integer(myds$grp)                 # 점의 모양 지정
color <- c("red","green","blue")              # 점의 색 지정   
pairs(myds[,-6], pch=point, col=color[point])

## (9) correlation coefficient ------------------
cor(myds[,-6])
