import UIKit

/*
// Int16은 -32768 ~ 32767까지 저장 가능
var n : Int16 = 10000

// 결과값이 40000이 되어서 Overflow가 발생
// n = n + 30000

// Overflow 연산을 허용하는 &+ 연산자를 이용
n = n &+ 30000

print("n : \(n)")
*/

/*
var year = 2018
// year가 윤년인지를 판별하는 표현식
// 4의 배수이고 100의 배수는 아닌 경우, 400의 배수인 경우
var leafcheck = ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
print(leafcheck)

// 30 : 00000000 00000000 00000000 00011110
// 23 : 00000000 00000000 00000000 00010111
// 30 & 23 : 00000000 00000000 00000000 00010110 = 22
var result = 30 & 23
print(result)

var n = 20
n += 1
print(n)
*/

/*
let ar = 1...3
for imsi in ar{
	print(imsi)
}

let br = 1..<3
for imsi in br{
	print(imsi)
}
*/

/*
// year가 윤년이면 "year년은 윤년입니다.", 그렇지 않으면 "year년은 윤년이 아닙니다."로 출력
var year = 2018
if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
{print("\(year)년은 윤년입니다.")}
else
{print("\(year)년은 윤년이 아닙니다.")}
*/

/*
// 마우스 좌클릭과 우클릭 그리고 더블 클릭 3가지 동작을 구분해서 수행
var action = 1
let LBUTTONCLICK = 1
let RBUTTONCLICK = 2
let DOUBLEBUTTONCLICK = 3

/*
if action == LBUTTONCLICK {
	print("마우스 좌클릭")
}
else if action == RBUTTONCLICK {
	print("마우스 우클릭")
}
else if action == DOUBLEBUTTONCLICK {
	print("마우스 더블 클릭")
}
*/

/*
switch action {
case LBUTTONCLICK:
	print("마우스 좌클릭")
case RBUTTONCLICK:
	print("마우스 우클릭")
case DOUBLEBUTTONCLICK:
	print("마우스 더블 클릭")
default:
	print("잘못된 동작입니다.")
}
*/
*/

/*
var score = 80
// score가 80 이상이면 우수, 60 이상이면 보통, 그 이외에는 저조로 출력
switch score {
case 80...100:
	print("우수")
case 60..<80:
	print("보통")
default:
	print("저조")
}
*/

/*
// 1 ~ 10까지 홀수만 출력
var i = 1
while i<=10 {
	print(i)
	i = i + 2
}

var li = 100 ... 104
for i in li.reversed(){
	print(i)
}
*/

