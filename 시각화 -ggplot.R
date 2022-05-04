#필요한 페키지 설치
install.packages('ggplot2')

#필요한 패키지 사용하기
library(ggplot2)

diamonds

#qplot()함수
qplot(diamonds$carat, diamonds$price) # -- (1)
qplot(carat, price, data = diamonds) # -- (2)
qplot(carat, price, data = diamonds, geom = "point", colour = clarity) # -- (3)
qplot (carat, price, data = diamonds, geom= c( "point", "smooth"), method = lm) # -- (4)
qplot (carat, data = diamonds, geom = "histogram") # -- (5)


ggplot(data = diamonds, aes(x=carat, y=price)) + geom_point(aes(colour = clarity))


#데이터 만들기

Length <- c(2,1,4,9)
width <- c(3,2,5,10)
depth <- c(4,1,15,20,30)
trt <- c("a","a","b","b")
data <- data.frame(Length, width, depth, trt)
data
editData(data)

#데이터 입력 방법 쉽게 
x <- scan()
x <- scan(what = "")

df <- data.frame() #빈 데이터 프레임 만들기
df <- edit(df) #빈 데이터 프레임 편집

#패키지 사용 데이터 편집
install.packages("editData")
library(editData)

editData(diamonds)


kids <- data.frame()
edit(kids)
##############

ggplot(data, aes(x=Length, y=width))+
  geom_point(aes(colour=trt))

ggplot(data, aes(x=Length, y=width))+
  geom_line(aes(colour=trt))

ggplot(data, aes(x=Length, y=width))+
  geom_point(aes(colour=trt))+
  geom_smooth()


############################

ggplot(data=mtcars) + 
  geom_histogram(mapping = aes(hp))

##더 간단히 하려면, 'mapping ='도 생략 가능하다. 단, aes()는 생략할 수 없다.
ggplot(data=mtcars) + 
  geom_histogram(aes(hp))

##이 미학 요소 매핑 부분은 다음과 같이 GEOM 함수가 아닌, 윗단의 ggplot() 함수에서 적용할 수도 있고, ##간략히 표현하는 것도 가능하다. 물론 코드의 가독성을 위해서는 가급적 항목명을 모두 기재하는 것이 코##드를 보는 다른 사람들을 위해서도 좋겠다.


# 다음의 두 코드는 동일
ggplot(data=mtcars, mapping = aes(x=hp)) + 
  geom_histogram()

# 매우 간략하게 기재되었음
ggplot(mtcars, aes(hp)) + 
  geom_histogram()  


##############

qplot(carat, price, data = diamonds, geom = "point",colour=clarity) #--(1)

ggplot(data=diamonds, aes(x=carat, y=price))+
  geom_point(aes(colour = clarity))


s <- ggplot(data =diamonds, aes(x = carat, y = price))
summary(s)


###미적 요소를 매핑한 코드는 다음 레이어로 상속되지 않음

ggplot(data = diamonds, aes( x = carat, y = price))+
  geom_point(aes(colour =clarity))+geom_smooth()

ggplot(data=diamonds, aes( x = carat, y = price, colour = clarity))+
  geom_point()+geom_smooth()



ggplot(faithful, aes(waiting, eruptions))+
  geom_point()+
  coord_cartesian(xlim = c(min(faithful$waiting)-5, max(faithful$waiting)+5))

###### 그룹매핑

p <- ggplot(data = diamonds, aes ( x = carat, y = price))
p + geom_smooth ()    
p + geom_smooth (aes(group = clarity))






#### GEOM 과 STAT의 결합

#예를 들어, geom_histogram()의 STAT은 bin을 기본으로 한다,args() 함수는 괄호 안에 들어가는 함수명의 인자들 및 default 값들을 리스트업해준다.

args(geom_histogram)


s <- ggplot(data = diamonds, aes (x = price))
s + geom_bar()
s + geom_histogram(aes(y = ..count..)) 
s + geom_histogram(aes(y = ..density..))
s + geom_histogram(aes(y = ..ncount..))
s + geom_histogram(aes(y = ..ndensity..))
s + geom_histogram(aes(y = ..density..)) + ylab("밀도")

s + stat_count()

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut, fill = cut))

ggplot(data = diamonds) + 
  stat_summary(mapping = aes(x = cut, y = depth), fun.ymin = min,  fun.ymax = max, fun.y = median)


#####위치 조정

ggplot(data=diamonds, aes(x=price))+
  geom_bar(aes(fill=cut), binwidth=3000)

ggplot(data=diamonds, aes(x=price))+
  geom_bar(aes(fill=cut), binwidth=3000, position="dodge")

ggplot(data=diamonds, aes(x=price))+
  geom_bar(aes(fill=cut ), binwidth=3000, position="fill")


ggplot(data=diamonds, aes(x=price))+
  geom_bar(binwidth=3000)+
  facet_grid(.~cut)

ggplot(data=diamonds, aes(x=price))+
  geom_histogram(binwidth=3000)+
  facet_wrap(~cut, nrow=2)

#### GEOM 과 STAT의 결합

d <- ggplot(diamonds, aes(x= price))
d + stat_bin(geom ="bar")
d + stat_bin(geom ="area")
d + stat_bin(aes(size = ..ndensity.. ), geom="point")
d + stat_bin(aes(y = 1 ,fill = ..density..), geom="tile")

########스케일링

grep("scale_",ls("package:ggplot2"), value = TRUE)


###범위 

ggplot(iris, aes (Sepal.Length, Sepal.Width))+
  geom_point()+
  coord_cartesian(xlim = c(4, 6))


ggplot(iris, aes(Sepal.Length, Sepal.Width))+
  geom_point()+
  xlim(5, 6)


ggplot (iris, aes(Sepal.Length, Sepal.Width))+
  geom_point()+
  scale_x_continuous(limits = c(5, 6))

#### 색상

d <- ggplot(diamonds, aes(carat,depth, colour = price)) + geom_point()

g1 <- d + scale_colour_gradient()
gi
d2 <- ggplot(diamonds, aes(carat,depth, colour =color)) + geom_point ()
g2 <- d2 + scale_color_hue()
g2
g3 <- d2 + scale_colour_hue("색깔", breaks = c ("D", NA), labels = c("D급","모름"))
g3
g4 <- d2 + scale_colour_brewer(palette = "Blues" ) 
g4

ggplot(iris,aes(Sepal.Width, Sepal.Length))+geom_point(aes(colour = Species))+scale_color_manual(values = c("blue","red","yellow"))


###########