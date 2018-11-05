import UIKit

/*
// Hello Swift 3번 출력 함수 생성
// 함수를 생성
func dispSwift(){
for _ in 1...3{
print("Hello Swift")
}
}

// 함수 호출
dispSwift()
*/

/*
// 함수 생성
func dispSwift(cnt : Int){
	for _ in 1...3{
		print("Hello Swift")
	}
}
// 함수 호출 - 매개변수는 이름과 함께 대입
 dispSwift(cnt : 5)
*/

/*
// 매개변수가 존재하는 함수 생성
func dispSwift(start : Int, end : Int){
	for _ in start...end{
		print("Hello Swift")
	}
}
// 함수 호출 - 매개변수는 이름과 함께 대입
dispSwift(start : 5, end : 8)
*/

/*
// msg는 외부에서는 이름없이 대입 가능, 내부에서는 msg라는 이름 사용
// start, end는 기본값 1을 설정
func dispSwift(_ msg : String, start : Int = 1, end : Int = 1){
	for _ in start...end{
		print(msg)
	}
}
dispSwift("Swift의 Function 생성")
dispSwift("Swift Function의 유연함", end:3)
*/

/*
// 여러 개의 매개변수를 대입할 수 있는 함수
func sum(nums : Int ...){
	var tot = 0
	for i in nums{
		tot = tot + i
	}
	print("합계는 \(tot)")
}
// 2개, 3개를 대입해서 함수 호출
sum(nums : 10, 30)
sum(nums : 30, 20, 77)
*/

/*
// 매개변수의 참조를 받기 위해서 inout을 추가
func inc(n : inout Int){
	n = n + 1
	print ("n:\(n)")
}
var x : Int = 10
// 참조를 전달하기 위해서 참조를 나타내는 &를 함께 전달
inc(n:&x)
print("x:\(x)")
*/

/*
// 다양한 정수를 받아서 합계, 평균, 최대값을 리턴하는 함수
func summary(nums : Int...) -> (Int, Int, Int){
var sum = 0
var max = 0
var avg = 0
for i in nums{
	sum = sum + i
	if max < i {
		max = i
		}
	}
	avg = sum / nums.count
	return (sum, avg, max)
}
	var result = summary(nums: 10, 30, 70, 40)
	print(result)
//	Tuple은 분할 저장이 가능 (중요)
	var(sum, avg, max) = summary(nums: 10, 30, 70, 40)
	print("합계 : \(sum)")
	print("평균 : \(avg)")
	print("최대값 : \(max)")
*/

/*
// 콜백 메소드 지정에 주로 이용
// 이벤트 핸들링시 이벤트가 발생하면 호출할 함수를 지정
func disp(){
	print("함수")
}
disp()

// ()를 하지 않고 함수를 호출하면 함수가 저장된 곳의 참조
var f = disp
f()
*/

/*
var f = {
	(arg : Int) -> (Void) in
	print("Hello Swift Closure")
}
// Closure와 일반 함수의 차이점은 실제로 호출할 경우가 드물다는 것이다.
// Closure 호출에는 매개 변수의 이름이 필요가 없다.
f(3)
*/

/*
// 배열, Set의 sort 함수
// 1. 비교 가능한 데이터들은 정렬
// 2. 비교 불가능하거나 비교 방법을 다르게 할 데이터들의 경우 : by라는 매개변수에 2개의 매개변수를 가지며 Bool을 리턴하는 함수를 대입
var ar = [70, 80, 90, 93, 37, 81]
// 배열의 데이터 정렬 - 오름차순
ar.sort()
print(ar)
/*
// 배열의 내림차순을 위한 함수
func mycompare(n1 : Int, n2 : Int) -> Bool{
	return n1 > n2
}
*/
/*
// by 매개변수에 비교 함수를 대입 - Closure를 이용
ar.sort(by:{(n1 : Int, n2 : Int) -> (Bool) in
	return n1 > n2
})
print(ar)
*/
// 함수를 대입해야 하는 매개변수가 가장 마지막에 존재시 함수 호출 구문 뒤에 Closure 작성 가능
// Trailing Closure 문법 : 가독성 우수 ?
ar.sort(){(n1 : Int, n2 : Int) -> (Bool) in
	return n1 > n2
}
print(ar)
*/

/*
// 함수(매개변수, 리턴 X)를 매개변수로 받는 Closure 함수
func closure(fn : @escaping () -> Void){
	// 매개변수로 받은 함수 호출
	fn()
	// 매개변수로 받은 함수를 f에 대입, 실행 - 오류 발생
	// 매개변수의 이름 앞에 @escaping 추가시 사용 가능
	var f = fn
	f()
}
closure(){() -> Void in print("Closure 호출")}
*/

/*
// @autoclosure는 함수가 아닌 일반 표현식을 Closure로 변경해주는 예약어
func autowrapping(fn : @autoclosure() -> Bool){
	if fn() == true {
		print("true return")
	}else{
		print("false return")
	}
}
autowrapping(fn:(100>40))
*/

/*
struct Person{
// Property 생성
var num = 0
var name = "noname"
var score = 0

	// 모든 데이터 출력 메소드
	func disp(){
		print("번호 : \(num), 이름 : \(name), 점수 : \(score)")
	}
}
var person1 = Person()
person1.disp()

// Init이 없지만 구조체는 즉시 값을 대입해서 인스턴스 생성 가능
var person2 = Person(num : 1, name : "을지문덕", score : 97)
person2.disp()
*/

/*
// 구조체와 클래스의 인스턴스의 차이
struct StructPoint {
	var x = 0
	var y = 0
	
	func disp(){
		print("x : \(x), y : \(y)")
	}
}
class ClassPoint {
	var x = 0
	var y = 0
	
	func disp(){
		print("x : \(x), y : \(y)")
	}
}

var st1 = StructPoint()
// 구조체 복사 - 값 동일, 저장 위치 상이
var st2 = st1
st1.disp()
st2.disp()
print("================")
// st2의 데이터를 변경
st2.x = 100
st2.y = 80
st1.disp()
st2.disp()

var class1 = ClassPoint()

print("================")
// 클래스 복사 - 참조 주소 동일, 데이터 동일
var class2 = class1

// class2가 참조하는 곳의 데이터를 변경
class2.x = 80
class2.y = 100
class1.disp()
class2.disp()
*/

/*
class Rect{
// 저장 Property 생성
	var x : Int = 0
	var y : Int = 0
	var width : Int = 0
	var height : Int = 0

// 연산 Property 생성
	var center : (Int, Int) {
		get {
			return ((x+width)/2, (y+height)/2)
		}
	}
		init(){
			print("Rect의 init 메소드")
		}
}

	class Drawing{
		init(){
			print("Drawing의 생성자")
		}
		// rect를 처음 사용시 Rect를 생성
		lazy var rect = Rect()
}
var drawing = Drawing()
	print("Rect가 언제 만들어 질까요!?")
	drawing.rect.x = 100
*/

class T{
	var x : Int = 0{
		
		// Property Observer
		willSet(value){
			print("x의 값이 변경되기 직전입니다.")
		}
		didSet(value){
			print("x의 값이 변경된 후입니다.")
		}
	}
	
	func setX(x : Int){
		print("x의 값이 변경되기 직전입니다.")
		self.x = x
		print("x의 값이 변경된 후입니다.")
	}
}
var t = T()
// t.setX(x: 100)
t.x = 100


