##### 점(point) 그리기, points()

( x <- rep(1:5, 5) ) 
( y <- rep(5:1, rep(5,5)) ) 

plot(1:5, type="n", xlim=c(0,7), ylim=c(0.5,5.5), main="POINTS") 
points(x, y, pch=1:25, cex=2.5) 
text(x-0.5, y, labels=as.character(1:25), cex=1) 

points(rep(6,3), 5:3, pch=65:67, cex=1.5) 
text(rep(6,3)+0.5, 5:3, labels=as.character(65:67), cex=1) 

kkyo <- c("@", "꺄") 
points(rep(6,2), 2:1, pch=kkyo, cex=1.5) 
text(rep(6,2)+0.5, 2:1, labels=c("글","자"), cex=1)



##### 선(line) 그리기, lines()

plot(1:6, 1:6, type="n", xlim=c(0.5,5.5), ylim=c(0,20), xlab="", ylab="", main="LINES") 


#lty 정해진 선의 숫자를 1~6까지 숫자로 입력.
lines(c(1,3), c(20,20), lty=1, col=1)
lines(c(1,3), c(19,19), lty=2, col=2)
lines(c(1,3), c(18,18), lty=3, col=3)
lines(c(1,3), c(17,17), lty=4, col=4)
lines(c(1,3), c(16,16), lty=5, col=5)
lines(c(1,3), c(15,15), lty=6, col=6)

# lty 정해진 선의 이름을 문자열로 입력.
lines(c(1,3), c(14,14), lty=c("blank"))
lines(c(1,3), c(13,13), lty=c("solid"))
lines(c(1,3), c(12,12), lty=c("dashed"))
lines(c(1,3), c(11,11), lty=c("dotted"))
lines(c(1,3), c(10,10), lty=c("dotdash"))
lines(c(1,3), c(9,9), lty=c("longdash"))
lines(c(1,3), c(8,8), lty=c("twodash"))

# lty 패턴 직접 지정. "B(선의길이)W(공백의길이)" 또는 "BWBW" (단, B,W는 16진수)
lines(c(1,3), c(6,6), lty=c("53"))
lines(c(1,3), c(5,5), lty=c("35"))
lines(c(1,3), c(4,4), lty=c("F6"))
lines(c(1,3), c(3,3), lty=c("6F"))
lines(c(1,3), c(2,2), lty=c("FC84"))

legend(3.5, 20, legend=1:6, lty=1:6)
legend(3.5, 13, legend=c("blank","solid","dashed","dotted","dotdash","longdash","twodash"), lty=1:6)

legend(3.5, 5, legend=c("53","35","F6","6F","FC84")) 



##### 선(line) 그리기, abline()
cars[1;5, ]
z <- lm(dist ~ speed, data=cars)
z$coef

plot(cars, main="ABLINE")
abline(z, lty=2, lwd=2, col=2)
abline(h=30, col=3)   # abline(a=30, b=0)
abline(v=20, col=4)
abline(a=30, b=4, col=5)


##### 선(line) 그리기, segments()
##segments() : lines() 와 비슷하나, 벡터로 구성된 여러 점들을 분할해서 출력 가능한 함수.

x <- runif(12); y <- rnorm(12, sd=2)
i <- order(x);
x <- x[i]; y <- y[i]
x
y
par(mfrow=c(2,1))
plot(x, y, main="SEGMENTS() - 2 seg.")
s <- seq(length(x)-1); s
segments(x[s], y[s], x[s+2], y[s+2], lty=1:2, col=2:3)
plot(x, y, main="SEGMENTS() - 3 seg.")
ss <- seq(length(x)-2); ss
segments(x[ss], y[ss], x[ss+3], y[ss+3], lty=1:3, col=4:6) 




#####(area) 그리기, box()
#box() : 현재 plot에 네모 모양(상자)을 그리는 함수. (plot region 아닌 곳에 네모를 그림.)
#function (which = "plot", lty = "solid", ...)


#which : 상자를 그릴 영역. 
#"plot" : (default) plot region의 가장자리.
#"figure" : figure region의 가장자리.
#"inner" : outer margin의 안쪽 부분.(화면 분할 시. if not, figure와 같음)
#"outer" : 제일 바깥 선.
#bty : 상자의 종류(모양). which="plot"일 때만 사용 가능.
#lty : line type. 선의 유형.
#lwd : 선의 굵기.
#col : 선의 색상.
#main : plot의 제목, 이름.


par(oma=c(2,2,4,2))   # outer margin 
par(mar=c(2,2,2,2))   # margin 
hist(rnorm(100), axes=FALSE, xlab="", ylab="", main="BOX") 
axis(1, at=-2:2, labels=letters[1:5]) 
box(which="outer", lty=1, col=2) 
box(which="inner", lty=2, col=3) 
box(which="figure", lty=3, col=4) 
box(which="plot", lty=4, col=5) 
legend(locator(1), legend=c("outer","inner","figure","plot"), lty=1:4, col=2:5) 



#####사각형(rectangle) 그리기, rect()

#rect() : plot region 안에 네모 모양(상자)을 그리는 함수.

#function (xleft, ybottom, xright, ytop, density = NULL, angle = 45,col = NA, border = NULL, lty = par("lty"), lwd = par("lwd"), ...)


#xleft : 사각형의 왼쪽 x좌표.
#ybottom : 사각형의 아래쪽 y좌표.
#xright : 사각형의 오른쪽 x좌표
#ybottom : 사각형의 위쪽 y좌표.
#col : 사각형의 내부 색상.
#border : 사각형의 테두리 색상.
#lty : 선의 종류.(테두리 및 내부 빗금)
#lwd : 선의 굵기.(테두리 및 내부 빗금)
#density : 내부 선들의 밀도.(내부 빗금)
#angle : 내부 선들의 기울기. (내부 빗금. default=45) 
#main : plot의 제목, 이름.
#####


plot(1:10, type="n", axes=FALSE, xlab="", ylab="", main="RECT")
rect(xleft=1, ybottom=7, xright=3, ytop=9)
rect(4, 7, 6, 9, lwd=2)
rect(7, 7, 9, 9, lty=2)

rect(1, 4, 3, 6, col='gold')
rect(4, 4, 6, 6, col='gray', border='green')
rect(7, 4, 9, 6, border='red')

rect(1, 1, 3, 3, density=10)
rect(4, 1, 6, 3, density=20)
rect(7, 1, 9, 3, density=15, angle=135)

text(2, 9.5, adj=0.5, "default")
text(5, 9.5, adj=0.5, "lwd=2")
text(8, 9.5, adj=0.5, "lty=2")

text(2, 6.5, adj=0.5, "col=\'gold\'")
text(5, 6.5, adj=0.5, "col=\'gray\', border=\'green\'")
text(8, 6.5, adj=0.5, "border=\'red\'")

text(2, 3.5, adj=0.5, "density=10")
text(5, 3.5, adj=0.5, "density=20")
text(8, 3.5, adj=0.5, "density=10, angle=135")




#####다각형 그리기, polygon()
#polygon() : 좌표 점들을 연결하여 다각형(closed..)을 그리는 함수.

#function (x, y = NULL, density = NULL, angle = 45, border = NULL,col = NA, lty = par("lty"), ..., fillOddEven = FALSE)

#x, y : 좌표. 
#col : 색상.
#lty : line type. 선의 종류.
#lwd : 선의 굵기.
#density : 내부 선들의 밀도.
#angle : 내부 선들의 기울기.

rd <-seq(-pi, pi, length=8);    x <- cos(rd); y <- sin(rd)
plot(1:7, type="n", axes=FALSE, xlab="", ylab="", main="POLYGON")

x1 <- x + 2; y1 <- y + 5
polygon(x1, y1)

x2 <- x + 5; y2 <- y + 5
polygon(x2, y2, col='pink', border='gold')

x3 <- x + 2; y3 <- y + 2
polygon(x3, y3, lty=2, lwd=2.5)

x4 <- x + 5; y4 <- y + 2
polygon(x4, y4, density=10, angle=135)

text(2, 6.5, adj=0.5, "default")
text(5, 6.5, adj=0.5, "col, border")
text(2, 3.5, adj=0.5, "lty, lwd")
text(5, 3.5, adj=0.5, "density, angle") 



#####좌표축(coordinate axis) 그리기, axis()
#axis() : outer margin이나 plot margin에 좌표축을 그리는 함수.
#function (side, at = NULL, labels = TRUE, tick = TRUE, line = NA,pos = NA, outer = FALSE, font = NA, lty = "solid", lwd = 1,lwd.ticks = lwd, col = NULL, col.ticks = NULL, hadj = NA, padj = NA, ...)

#side : 좌표축 그릴 위치.
#line : 좌표축 그릴 라인 위치.
#at : 기준점 정의.
#tick : FALSE이면 기준점만 표시, 눈금은 표시하지 않음.
#pos : 좌표축을 plot region에 나타낼 위치.
#outer : outer margin에 그림.
#lty : 선의 종류.
#lwd : 선의 굵기.
#col : 좌표축의 선, 기준점들의 색상.
#col.axis : 좌표축의 눈금들의 색상.


par(oma=c(0,0,3,0))   # outer margin
plot(1:5, type="n", axes=FALSE, xlab="", ylab="", main="AXIS")
grid(lty=2, lwd=1.5, col='gray')   # grid

axis(side=1, at=1:5, labels=letters[1:5], line=2)
axis(side=2, at=c(1,3,5), labels=LETTERS[1:3], lty=2, lwd=2.5)
axis(side=3, outer=T)
axis(side=3, at=3:5, pos=3, col='red', col.axis='blue')
axis(side=4, tick=FALSE) 




######범례(legend) 넣기, legend()

#legend() : 변수가 여러 개일 때 plot에 범례를 넣는 함수.


#점 그래프(ex. 산포도 등) → pch 인수 사용.
#선 그래프(ex. 추세선 등) → lty 인수 사용.
#면 그래프(ex. 히스토그램, 막대그래프 등) → fill 인수 사용.
#범례의 <위치지정 시
##- (x, y) 좌표로 지정.
##- 문자열 사용 : "bottomright", "bottom", "bottomleft", "left", "topleft", "top", "topright", "right","center"
##- locator() 함수 사용해서 직접 마우스로 위치 지정.


plot(1:10, type="n", xlab="", ylab="", main="LEGEND")
grid(lty=2, lwd=2, col='gray')

# 정해진 문자명 입력.
legend("bottom", "(x1,y1)", pch=1, title="bottom")
legend("left", "(x2,y2)", pch=1, title="left")
legend("top", "(x3,y3)", pch=1, title="top")
legend("right", "(x4,y4)", pch=1, title="right")
legend("center", "(x5,y5)", pch=1, title="center")
legend("topleft", "(x6,y6)", pch=1, title="topleft")
legend("topright", "(x7,y7)", pch=1, title="topright")
legend("bottomleft", "(x8,y8)", pch=1, title="bottomleft")
legend("bottomright", "(x9,y9)", pch=1, title="bottomright")

# (x, y) 좌표 입력.
lgd <- c("value1","value2");
legend(2.5, 8, legend=lgd, pch=1:2, col=1:2)
legend(2.5, 6, legend=lgd, pch=3:4, col=3:4, lty=1:2)
legend(2.5, 4, legend=c("value1","value2", "value3"), fill=2:4, col=4:6)

# 사용자가 직접 마우스로 찍어 위치 지정.
legend(locator(1), legend="Locator", fill=1) 





##############################
#### 그래프 그리기 PLOT()##########
##############################

plot(mpg~disp,data=mtcars)

# y축 값을 동일하게 설정해서 출력하기
y <- c(1,2,3,4)
plot(y)


# x,y축 값을 다 지정해서 출력하기
x <- 1:3
y <- 4:6
plot(x,y)


# x,y 축 한계값 조정하기
x <- 1:3
y <- 4:6
plot(x,y,xlim=c(1,5), ylim=c(1,10))


# x축과 y축 제목, 그래프제목 지정해서 출력
x <- 1:3
y <- 4:6
plot(x,y, xlim=c(1,5), ylim=c(1,10), xlab="x축값", ylab="y축값", main="PLOT TEST")


# 여러조건을 추가해서 그래프 만들기
apple <- c(100,120,160,140,150)
plot(apple, type="o", col="red", ylim=c(0,200), axes=FALSE, ann=FALSE)
axis(1,at=1:5, lab=c("월","화","수","목","금"))
axis(2,ylim=c(0,200))
title(main="APPLE", col.main="red", font.main=4)
title(xlab="요일", col.lab="black")
title(ylab="가격", col.lab="blue")


# 한 화면에 여러개의 그래프를 동시에 배치
# par (mfrow =c(행의 갯수, 열의 갯수))
par(mfrow=c(1,3))
apple <- c(10,20,25,15,20)


plot(apple, type="o")
plot(apple, type="s")
plot(apple, type="l")


# 여러개의 그래프를 중첩으로 그리기
# par(new=T), par(add=T)를 그래프가 추가될때마다 사용해야함
par(mfrow=c(1,1))
y1 <- c(1,2,3,4,5)
y2 <- c(2,3,4,5,6)
y3 <- c(3,4,5,6,7)

plot(y1, type="s", col="red", ylim=c(1,10))


# 중복허용
par(new=T)
plot(y2, type="o", col="green", ylim=c(1,10))


# 중복허용
par(new=T)
plot(y3, type="s", col="blue", ylim=c(1,10))


# lines( )함수를 사용하여 그래프를 중첩으로 그리기
y1 <- c(1,2,3,4,5)
y2 <- c(2,3,4,5,6)
y3 <- c(3,4,5,6,7)

plot(y1, type="s", col="red", ylim=c(1,10))
lines(y2, type="o", col="green", ylim=c(1,10))
lines(y3, type="s", col="blue", ylim=c(1,10))


# 범례 추가하기
# legend (x축위치, y축위치, 내용, cex=글자크기, col=색상, pch=크기, lty=선모양)
legend(4,9,c("Y1","Y2","Y3"), cex=0.9, col=c("red", "green", "blue"), lty=1)




####barplot( ) : 막대 그래프 그리기
# 기본 bar 그래프
x <- c(1,2,3,4,5)
barplot(x)

x <- c(1,2,3,4,5)
barplot(x, horiz=T)


# 그룹으로 묶어서 출력 (beside=T)
x <- matrix(c(1,2,3,4),2,2)
barplot(x, beside=T, names=1:2)

# 그룹으로 묶어서 하나의 막대로 출력
x <- matrix(c(1,2,3,4),2,2)
barplot(x, names=1:2)

# 그룹으로 묶어서 가로로 출력(beside, horiz=T)
x <- matrix(c(1,2,3,4),2,2)
barplot(x, beside=T, horiz=T, names=1:2)

barplot(x, horiz=T, names=1:2)

# 여러가지 옵션을 추가하여 그래프 그리기
x <- matrix(c(1,2,3,4),2,2)
barplot(x, beside=T, horiz=T, names=1:2)

apple <- c(100,120,140,130,150)
barplot(apple, main= "Apple", xlab="요일", ylab="금액", names.arg=c("월","화","수","목","금"),border="green", density=c(10,20,30,40,50))

# 여러막대그래프를 그룹으로 묶어서 한꺼번에 출력
apple <- c(100,120,140,130,150)
peach <- c(180,200,210,190,170)
berry <- c(110,150,160,90,120)

fruits <- data.frame(APPLE=apple, PEACH=peach, BERRY=berry)
fruits

barplot(as.matrix(fruits), main="FRUITS", ylab="수량", beside=T, col=rainbow(5), ylim=c(0,400))

legend(14,400, c("월","화","수","목","금"), cex=0.8, fill=rainbow(5))

# 하나의 막대그래프에 여러가지 내용 출력하기
barplot(t(fruits), main="FRUITS", ylab="판매량", ylim=c(0,900), col=rainbow(3), space=0.1, cex.axis=0.8, las=1, names.arg=c("월","화","수","목","금"), cex=0.8)
legend(3.5, 900, names(fruits), cex=0.8, fill=rainbow(3))

# 조건을 주고 그래프 그리기
peach <- c(180,200,210,190,170)
colors <- c( )
for( i in 1:length(peach)){if (peach[i] >= 200) {colors <- c(colors, "red")} else { colors <- c(colors, "blue")}}

barplot(peach, main="PEACH", xlab="요일", ylab="수량", names.arg=c("월","화","수","목","금"), col=colors)




####히스토그램 그래프 : hist( )

height <- c(182,175,167,172,163,178,181,166,159,155)
hist(height, main="histogram of height")


set.seed(1); 
data <- round(rnorm(100, mean=0, sd=2), digit=2) 
summary(data) 

nclass.Sturges(data)
pretty(data, nclass.Sturges(data)) 

nclass.scott(data) 

pretty(data, nclass.scott(data)) 

nclass.FD(data) 

pretty(data, nclass.FD(data)) 

pt <- pretty(data, nclass.FD(data)) 

for (i in seq(length(pt)-1) ){print( sum(pt[i] < data & data <= pt[i+1]) )} 


par(mfrow=c(2,1), mar=c(4,4,4,0), oma=c(0,0,0,0)) 

hist(data, labels=TRUE, main="breaks=default") # ex 1 
hist(data, labels=LETTERS[1:10], main="breaks=default") # ex 2 


par(mfrow=c(2,2), mar=c(4,4,4,0), oma=c(0,0,0,0)) 

hist(data, freq=FALSE, labels=TRUE, main="probabilities") # ex 3 
hist(data, breaks="Sturges", main="breaks=\"Sturges\"") # ex 4 
hist(data, breaks="Scott", main="breaks=\"Scott\"") # ex 5 
hist(data, breaks=nclass.FD, main="breaks=nclass.FD") # ex 6 

par(mfrow=c(1,2), mar=c(4,4,4,0), oma=c(0,0,0,0)) 
hist(data, axes=FALSE, main="axes=FALSE") # ex 7 
hist(data, col="gold", border="hotpink", main="col, border") # ex 8 

hist(data, plot=FALSE) 




#####파이(pie)모양의 차트 : pie( )
#기본 pie차트
apple <- c(10,20,30,40)
pie(apple)


# 시작 각도를 90도로 지정
apple <- c(10,20,30,40)
pie(apple, init.angle=90)

# 색깔과 label명 지정
apple <- c(10,20,30,40)
pie(apple, init.angle=90, col=rainbow(length(apple)), label=c("1주","2주","3주","4주"))

# 비율값을 함께 출력하기
pct <- round(apple/sum(apple)*100, 1)
lab <- paste(pct,"%")
pie(apple, init.angle=90, col=rainbow(length(apple)), label=lab)

legend(0.8,1.2,c("1주","2주","3주","4주"), cex=0.8, fill=rainbow(length(apple)))

# 범례를 생략하고 그래프에 바로 출력
pct <- round(apple/sum(apple)*100, 1)
lab1 <- c("1주","2주","3주","4주")
lab2 <- paste(lab1, "\n", pct, "%")
pie(apple,init.angle=90, col=rainbow(length(apple)), label=lab2)


##파이차트 비교
par(mfrow=c(1,2), mar=c(0,1,2,1))  # EX 1
pie(rep(1, 24), col = rainbow(24), radius = 0.9)
pie(rep(1, 200), labels = "", col = rainbow(200), border = NA, main = "col=rainbow(200)")


par(mfrow=c(3,2), mar=c(2,2,2,2)) # EX 2 
flowers <- round(runif(7, 1,30), 2) 

pie(flowers, main="default") 
fl.color <- c("blueviolet","tan","CadetBlue","DarkSeaGreen","plum","RosyBrown","thistle")
names(flowers) <- c("rose","cherry","cosmos","tulip","freesia","lily","salvia") 

pie(flowers, col = fl.color) 
pie(flowers, col = fl.color, labels = LETTERS[1:7]) 
pie(flowers, col = fl.color, edges=15, labels = letters[1:7]) 
pie(flowers, col = gray( seq(0.4, 1.0, length = 7)) ) 
pie(flowers, density = 10 + 5*1:7, col = fl.color) 
segments(0, 0, 0, 1, col = "red", lwd = 2)
text(0, 1, "init.angle = 90", col = 'red') 





########상자모양차트 : boxplot( ), 최대값, 최소값, 평균값 등을 비교할때 사용
boxplot(apple, banana, peach,col=c("yellow", "cyan", "green"),names=c("apple","banana","peach"),horizontal=TRUE)


##비교 차트 
par(mfrow=c(2,1), mar=c(4,4,2,1), oma=c(0,0,0,0))
boxplot (len ~ dose, data = ToothGrowth, subset = supp == "VC",main = "Guinea Pigs' Tooth Growth",boxwex = 0.25, at = 1:3 - 0.2, col = rainbow(4),xlab = "Vitamin C dose mg", ylab = "tooth length", ylim = c(0, 35))
xname <- c("OrangeJuice", "VitaminC")

boxplot (len ~ supp, data = ToothGrowth, width=3:2,staplewex=1, staplelty=4, names=xname,border="khaki4", col=c("LightSkyBlue", "tomato"))


#옵션 비교 
set.seed(1);
x1 <- runif(20);   x2 <- runif(20);   x3 <- runif(20);   x4 <- runif(20)
x <- list(x1, x2, x3, x4)

par(mfrow=c(3,2), mar=c(2,2,2,1), oma=c(0,0,0,0))

boxplot(x, main="default")

boxplot(x, width=1:4)

xname <- paste("x", 1:4, sep="")

boxplot(x, names=xname)

boxplot(x, staplewex=1)

boxplot(x, border='magenta', col=rainbow(5))

boxplot(x, horizontal=TRUE)


##########################
#####  저수준 함수란   #######
##########################
#####################
#points 점을 추가한다.
#lines 선을 추가한다
#abline 직선을 추가한다
#segment 선분을 추가한다
#ploygon 닫힌 다각형을 추가한다
#text, mtext 텍스트를 추가한다.
#legend 범례를 추가한다.
#######################


plot(mpg~disp,data=mtcars,pch=21,col="black",bg=mtcars$am+2,cex=1.2,main="연비와 배기량",xlab="배기량(cu.in)",ylab="연비(mile per gallon)",xlim=c(0,500),ylim=c(0,40),family="AppleGothic")


legend("topright",legend=c("automatic","manual"),pch=21,col="black",pt.bg=2:3,cex=1.2)

text(100,10,"피타고라스의 정리",family="AppleGothic")
text(100,7,labels=expression(italic(c^2==a^2+b^2)))

polygon(c(200,300,300),c(5,10,5))
polygon(c(290,290,300,300),c(5,6,6,5))

text(240,8.2,"c")
text(260,4,"a")
text(320,7.5,"b")

abline(h=20,col="green")
abline(v=400,col="blue")
out=lm(mpg~disp,data=mtcars)
abline(out,col="red",lwd=2,lty="dotted")
arrows(200,30,300,35,angle=30)
title(sub="subtitle")
mtext(side=1,line=2,"mtext,side=1,line=2")
mtext(side=2,line=2,"mtext,side=2,line=2")
mtext(side=3,line=0.5,"mtext,side=3,line=0.5")
