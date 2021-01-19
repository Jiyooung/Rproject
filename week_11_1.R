##### 11주차_1

sp <- split(iris, iris$Species)       # 품종별로 데이터 분리
sp                                    # 분리 결과 확인 
summary(sp)                           # 분리 결과 요약
sp$setosa                             # setosa 품종의 데이터 확인


subset(iris, Species == "setosa")
subset(iris, Sepal.Length > 7.5)
subset(iris, Sepal.Length > 5.1 & 
         Sepal.Width > 3.9)

subset(iris, Sepal.Length > 7.6,
       select=c(Petal.Length,Petal.Width))


x <- 1:100
y <- sample(x, size=10, replace = FALSE)  # 비복원추출
y


idx <- sample(1:nrow(iris), size=50, 
              replace = FALSE)
iris.50 <- iris[idx,]      # 50개의 행 추출
dim(iris.50)               # 행과 열의 개수 확인
head(iris.50)


sample(1:20, size=5)
sample(1:20, size=5)
sample(1:20, size=5)

set.seed(100)
sample(1:20, size=5)
set.seed(100)
sample(1:20, size=5)
set.seed(100)
sample(1:20, size=5)


combn(1:5,3)               # 1~5에서 3개를 뽑는 조합 

x = c("red","green","blue","black","white")
com <- combn(x,2)          # x의 원소를 2개씩 뽑는 조합 
com

for(i in 1:ncol(com)) {    # 조합을 출력
  cat(com[,i], "\n")
}


agg <- aggregate(iris[,-5], by=list(iris$Species), 
                 FUN=mean)
agg


agg <- aggregate(iris[,-5], by=list(표준편차=iris$Species), 
                 FUN=sd)
agg


head(mtcars)
agg <- aggregate(mtcars, by=list(cyl=mtcars$cyl,
                                 vs=mtcars$vs),FUN=max)
agg


x <- data.frame(name=c("a","b","c"), math=c(90,80,40))
y <- data.frame(name=c("a","b","d"), korean=c(75,60,90))
x
y


z <- merge(x,y, by=c("name"))
z


merge(x,y, all.x=T)    # 첫 번째 데이터셋의 행들은 모두 표시되게
merge(x,y, all.y=T)    # 두 번째 데이터셋의 행들은 모두 표시되게
merge(x,y, all=T)      # 두 데이터셋의 모든 행들이 표시되도록


x <- data.frame(name=c("a","b","c"), math=c(90,80,40))
y <- data.frame(sname=c("a","b","d"), korean=c(75,60,90))
x                    # 병합 기준 열의 이름이 name
y                    # 병합 기준 열의 이름이 sname
merge(x,y, by.x=c("name"), by.y=c("sname")) 
