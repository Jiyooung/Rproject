##### 10주차

z <- c(1,2,3,NA,5,NA,8)      # 결측값이 포함된 벡터 z
sum(z)                       # 정상 계산이 안됨
is.na(z)                     # NA 여부 확인
sum(is.na(z))                # NA의 개수 확인
sum(z, na.rm=TRUE)           # NA를 제외하고 합계를 계산


z1 <- c(1,2,3,NA,5,NA,8)      # 결측값이 포함된 벡터 z1
z2 <- c(5,8,1,NA,3,NA,7)      # 결측값이 포함된 벡터 z2
z1[is.na(z1)] <- 0            # NA를 0으로 치환 
z1                            
z3 <- as.vector(na.omit(z2))  # NA를 제거하고 새로운 벡터 생성
z3


# NA를 포함하는 test 데이터 생성
x <- iris
x[1,2]<- NA; x[1,3]<- NA
x[2,3]<- NA; x[3,4]<- NA  
head(x)

# for문을 이용한 방법
for (i in 1:ncol(x)) {
  this.na <- is.na(x[,i]) 
  cat(colnames(x)[i], "\t", sum(this.na), "\n")
}

# apply를 이용한 방법
col_na <- function(y) {
  return(sum(is.na(y)))
}

na_count <-apply(x, 2, FUN=col_na)
na_count


rowSums(is.na(x))            # 행별 NA의 개수  
sum(rowSums(is.na(x))>0)     # NA가 포함된 행의 개수 

sum(is.na(x))                # 데이터셋 전체에서 NA 개수


head(x)
x[!complete.cases(x),]              # NA가 포함된 행들 출력
y <- x[complete.cases(x),]          # NA가 포함된 행들 제거
head(y)                             # 새로운 데이터셋 y의 내용 확인


st <- data.frame(state.x77)
boxplot(st$Income)
boxplot.stats(st$Income)$out


out.val <- boxplot.stats(st$Income)$out     # 특이값 추출
st$Income[st$Income %in% out.val] <- NA     # 특이값을 NA로 대체
head(st)
newdata <- st[complete.cases(st),]          # NA가 포함된 행 제거
head(newdata) 


v1 <- c(1,7,6,8,4,2,3)
order(v1)
v1 <- sort(v1)                  # 오름차순
v1
v2 <- sort(v1, decreasing=T)    # 내림차순 
v2


head(iris)
order(iris$Sepal.Length)
iris[order(iris$Sepal.Length),]                   # 오름차순으로 정렬
iris[order(iris$Sepal.Length, decreasing=T),]     # 내림차순으로 정렬
iris.new <- iris[order(iris$Sepal.Length),]       # 정렬된 데이터를 저장
head(iris.new)
iris[order(iris$Species, decreasing=T, iris$Petal.Length),]  # 정렬 기준이 2개
