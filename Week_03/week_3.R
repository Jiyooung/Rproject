##### 3주차 : 벡터, 매트릭스

# 1
x <- c(1,2,3)           # 숫자형 벡터
y <- c("a","b","c")     # 문자형 벡터
z <- c(TRUE,TRUE, FALSE, TRUE)  # 논리형 벡터
x                       # x에 저장된 값을 출력
y
z

# 2
w <- c(4,9,3,"5","6","7")
w

w>=5
w>=4
w[w>3]
w>3
w[w>2]

# 3
v1 <- 50:90
v1
v2 <- c(1,2,5, 50:90)
v2

v3 <- seq(1,101,3)
v3
v4 <- seq(0.1,1.0,0.1)
v4

v5 <- rep(1,times=5)    # 1을 5번 반복
v5
v6 <- rep(1:5,times=3)  # 1에서 5까지 3번 반복
v6
v7 <- rep(c(1,5,9), times=3) # 1, 5, 9를 3번 반복
v7

# 4
score <- c(90,85,70)    # 성적
score
names(score)            # score에 저장된 값들의 이름을 보이시오
names(score) <- c("John","Tom","Jane") # 값들에 이름을 부여
names(score)            # score에 저장된 값들의 이름을 보이시오
score                   # 이름과 함께 값이 출력

# 5
d <- c(1,4,3,7,8)
d[1]
d[2]
d[3]
d[4]
d[5]
d[6]

d <- c(1,4,3,7,8)
d[c(1,3,5)]             # 1, 3, 5번째 값 출력
d[1:3]                  # 처음 세 개의 값 출력
d[seq(1,5,2)]           # 홀수 번째 값 출력
d[-2]                   # 2번째 값 제외하고 출력
d[-c(3:5)]              # 3~5번째 값은 제외하고 출력

# 6
GNP <- c(2090,2450,960)
GNP
names(GNP) <- c("Korea","Japan","Nepal")
GNP
GNP[1]
GNP["Korea"]
GNP[c("Korea","Nepal")] 

# 7
v1 <- c(1,5,7,8,9)
v1
v1[2] <- 3              # v1의 2번째 값을 3으로 변경
v1
v1[c(1,5)] <- c(10,20)  # v1의 1, 5번째 값을 각각 10, 20으로 변경
v1

# 8
d <- c(1,4,3,7,8)
2*d
d-5
3*d+4

# 9
x <- c(1,2,3)
y <- c(4,5,6)
x+y                     # 대응하는 원소끼리 더하여 출력
x*y                     # 대응하는 원소끼리 곱하여 출력
z <- x + y              # x, y를 더하여 z에 저장
z

# 10
d <- c(1,2,3,4,5,6,7,8,9,10)
sum(d)                  # d의 포함된 값들의 합
sum(2*d)                # d의 포함된 값들에 2를 곱한 후 합한 값
length(d)               # d에 포함된 값들의 개수
mean(d[1:5])            # 1~5번째 값들의 평균
max(d)                  # d에 포함된 값들의 최댓값
min(d)                  # d에 포함된 값들의 최솟값
sort(d)                 # 오름차순 정렬
sort(d, decreasing = FALSE) # 오름차순 정렬
sort(d, decreasing = TRUE)  # 내림차순 정렬
v1 <- median(d)
v1
v2 <- sum(d)/length(d)  # = mean(d)
v2

# 11
d <- c(1,2,3,4,5,6,7,8,9)
d>=5
d[d>5]                  # 5보다 큰 값
sum(d>5)                # 5보다 큰 값의 개수를 출력
sum(d[d>5])             # 5보다 큰 값의 합계를 출력
d==5
condi <- d > 5 & d < 8  # 조건을 변수에 저장
d[condi]                # 조건에 맞는 값들을 선택

# 12
ds <- c(90, 85, 70, 84)
my.info <- list(name='Tom', age=60, status=TRUE, score=ds)
my.info                 # 리스트에 저장된 내용을 모두 출력
my.info[[1]]            # 리스트의 첫 번째 값을 출력
my.info$name            # 리스트에서 값의 이름이 name인 값을 출력
my.info[[4]]            # 리스트의 네 번째 값을 출력

# 13
bt <- c('A', 'B', 'B', 'O', 'AB', 'A') # 문자형 벡터 bt 정의
bt.new <- factor(bt)    # 팩터 bt.new 정의
bt                      # 벡터 bt의 내용 출력
bt.new                  # 팩터 bt.new의 내용 출력
bt[5]                   # 벡터 bt의 5번째 값 출력
bt.new[5]               # 팩터 bt.new의 5번째 값 출력
levels(bt.new)          # 팩터에 저장된 값의 종류를 출력
as.integer(bt.new)      # 팩터의 문자값을 숫자로 바꾸어 출력
bt.new[7] <- 'B'        # 팩터 bt.new의 7번째에 'B' 저장
bt.new[8] <- 'C'        # 팩터 bt.new의 8번째에 'C' 저장
bt.new                  # 팩터 bt.new의 내용 출력

# 14
z <- matrix(1:20, nrow=4, ncol=5)
z                       # 매트릭스 z의 내용을 출력

z2 <- matrix(1:20, nrow=4, ncol=5, byrow=T)
z2                      # 매트릭스 z2의 내용을 출력

# 15
x <- 1:4                # 벡터 x 생성
y <- 5:8                # 벡터 y 생성
z <- matrix(1:20, nrow=4, ncol=5) # 매트릭스 z 생성
z
m1 <- cbind(x,y)        # x와 y를 열 방향으로 결합하여 매트릭스 생성
m1                      # 매트릭스 m1의 내용을 출력
m2 <- rbind(x,y)        # x와 y를 행 방향으로 결합하여 매트릭스 생성
m2                      # 매트릭스 m2의 내용을 출력
m3 <- rbind(m2,x)       # 매트릭스 m2와 벡터 x를 행 방향으로 결합
m3                      # 매트릭스 m3의 내용을 출력
m4 <- cbind(z,x)        # 매트릭스 z와 벡터 x를 열 방향으로 결합
m4                      # 매트릭스 m4의 내용을 출력