##### 6주차 : 조건문, 반복문, 함수, which
# 1
#if-else
job.type <- 'A'
if(job.type == 'B') {
  bonus <- 200          # 직무 유형이 B일 때 실행
} else {
  bonus <- 100          # 직무 유형이 B가 아닌 나머지 경우 실행 
}
print(bonus)

job.type <- 'B'
bonus <- 100
if(job.type == 'A') {
  bonus <- 200          # 직무 유형이 A일 때 실행
}
print(bonus)

# 2
score <- 85
if (score > 90)
{ grade <- 'A'
} else if (score > 80) {
  grade <- 'B'
} else if (score > 70) {
  grade <- 'C'
} else if (score > 60) {
  grade <- 'D'
} else {
  grade <- 'F'
}
print(grade)

# 3
a <- 10
b <- 20
if(a>5 & b>5) {         # and 사용
  print (a+b)
}
if(a>5 | b>30) {        # or 사용
  print (a*b)
}

# 4
a <- 10
b <- 20
if (a>b) {
  c <- a
} else {
  c <- b
}
print(c)
a <- 10
b <- 20
c <- ifelse(a>b, a, b)
print(c)

# 5
# 반복문
for(i in 6:10) {
  print(i)
}

for(i in 1:9) {
  cat('2 *', i,'=', 2*i,'\n')
}

for(i in 1:20) {
  if(i%%2==0) {         # 짝수인지 확인
    print(i)
  }
}

# 6
sum <- 0
for(i in 1:100) {
  sum <- sum + i        # sum에 i 값을 누적
}
print(sum)

# 7
norow <- nrow(iris)                               # iris의 행의 수
mylabel <- c( )                                   # 비어있는 벡터 선언
for(i in 1:norow) {
  if (iris$Petal.Length[i] <= 1.6) {              # 꽃잎의 길이에 따라 레이블 결정
    mylabel[i] <- 'L'
  } else if (iris$Petal.Length[i] >= 5.1) {
    mylabel[i] <- 'H'
  } else {
    mylabel[i] <- 'M'
  }
}
print(mylabel)                                    # 레이블 출력
newds <- data.frame(iris$Petal.Length, mylabel)   # 꽃잎의 길이와 레이블 결합
head(newds)                                       # 새로운 데이터셋 내용 출력

# 8
# while
sum <- 0
i <- 1
while(i <=100) {
  sum <- sum + i          # sum에 i 값을 누적
  i <- i + 1              # i 값을 1 증가시킴
}
print(sum)

# 9
sum <- 0
for(i in 1:10) {
  sum <- sum + i
  if (i>=5) break
}
sum

# 10
sum <- 0
for(i in 1:10) {
  if (i%%2==0) next
  sum <- sum + i
}
sum

# 11
# apply()
apply(iris[,1:4], 1, mean)  # row 방향으로 함수 적용
apply(iris[,1:4], 2, mean)  # col 방향으로 함수 적용

# 12
# 사용자 함수
mydiv <- function(x,y=2) {
  result <- x/y
  return(result) 
}
mydiv(x=10,y=3)         # 매개변수 이름과 매개변수값을 쌍으로 입력
mydiv(10,3)             # 매개변수값만 입력
mydiv(10)               # x에 대한 값만 입력(y 값이 생략됨)

# 13
myfunc <- function(x,y) {
  val.sum <- x+y
  val.mul <- x*y 
  return(list(sum=val.sum, mul=val.mul)) 
}
result <- myfunc(5,8)
s <- result$sum         # 5, 8의 합
m <- result$mul         # 5, 8의 곱
cat('5+8=', s, '\n')
cat('5*8=', m, '\n')

# 14
setwd("C:/Github/Rproject/Week 06/test")      # myfunc.R이 저장된 폴더
source("myfunc.R")      # myfunc.R 안에 있는 함수 실행
# 함수 사용
a <- mydiv(20,4)        # 함수 호출
b <- mydiv(30,4)        # 함수 호출
a+b
mydiv(mydiv(20,2),5)    # 함수 호출

# 15
# which()
score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
which(score==69)        # 성적이 69인 학생은 몇 번째에 있나
which(score>=85)        # 성적이 85 이상인 학생은 몇 번째에 있나
max(score)              # 최고 점수는 몇 점인가
which.max(score)        # 최고 점수는 몇 번째에 있나
min(score)              # 최저 점수는 몇 점인가
which.max(score)        # 최저 점수는 몇 번째에 있나

# 16
score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
idx <- which(score<=60) # 성적이 60 이하인 값들의 인덱스
score[idx] <- 61        # 성적이 60 이하인 값들은 61점으로 성적 상향 조정
score                   # 상향 조정된 성적 확인

idx <- which(score>=80)   # 성적이 80 이상인 값들의 인덱스
score.high <- score[idx]  # 성적이 80 이상인 값들만 추출하여 저장
score.high                # score.high의 내용 확인

# 17
idx <- which(iris$Petal.Length>5.0) # 꽃잎의 길이가 5.0 이상인 값들의 인덱스
idx
iris.big <- iris[idx,]              # 인덱스에 해당하는 값만 추출하여 저장
iris.big

# 18
# 1~4열의 값 중 5보다 큰 값의 행과 열의 위치
idx <- which(iris[,1:4]>5.0, arr.ind =TRUE)
idx

# 19
# 2개의 숫자 중 짝수 찾는 함수
myfunc <- function(x, y) {
  if (x%%2==0) {
    ret <- x
  } else {
    ret <- y
  }
  return(ret)
}