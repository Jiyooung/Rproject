##### 11주차 : 데이터 시각화 1
# 1
library(treemap)                     # treemap 패키지 불러오기
data(GNI2014)                        # 데이터 불러오기 
head(GNI2014)                        # 데이터 내용보기 
treemap(GNI2014,
        index=c("continent","iso3"), # 계층구조 설정(대륙-국가)
        vSize="population",          # 타일의 크기
        vColor="GNI",                # 타일의 컬러
        type="value",                # 타일 컬러링 방법
        bg.labels="yellow",          # 레이블의 배경색
        title="World's GNI")         # 트리맵 제목  

# 2
library(treemap)                  # treemap 패키지 불러오기
st <- data.frame(state.x77)       # 매트릭스를 데이터프레임으로 변환
st <- data.frame(st, stname=rownames(st)) # 주 이름 열 stname을 추가 

treemap(st,
        index=c("stname"),       # 타일에 주 이름 표기
        vSize="Area",            # 타일의 크기
        vColor="Income",         # 타일의 컬러
        type="value",            # 타일 컬러링 방법
        title="USA states area and income" ) # 트리맵의 제목

# 3
st <- data.frame(state.x77)       # 매트릭스를 데이터프레임으로 변환
symbols(st$Illiteracy, st$Murder, # 원의 x, y 좌표의 열
        circles=st$Population,    # 원의 반지름의 열
        inches=0.3,               # 원의 크기 조절값
        fg="white",               # 원의 테두리 색 
        bg="lightgray",           # 원의 바탕색
        lwd=1.5,                  # 원의 테두리선 두께
        xlab="rate of Illiteracy", 
        ylab="crime(murder) rate",
        main="Illiteracy and Crime")
text(st$Illiteracy, st$Murder,    # 텍스트가 출력될 x, y 좌표
     rownames(st),                # 출력할 텍스트
     cex=0.6,                     # 폰트 크기
     col="brown")                 # 폰트 컬러

# 4
head(mtcars)
mosaicplot(~gear+vs, data = mtcars, color=TRUE, 
           main ="Gear and Vs")
