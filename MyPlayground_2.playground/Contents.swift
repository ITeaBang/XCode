import UIKit

// 2개의 정수를 받아서 나누기 한 결과를 리턴하는 함수
/*
func division(split:Int, divide:Int) -> Int{
	let result = split / divide
	return result
}
*/

/*
// if를 이용한 유효성 검사 (만약 ~라면)
func division(split:Int, divide:Int) -> Int{
	if divide == 0 {
		print("0으로는 나눌 수 없습니다.")
		return -1
	}
	let result = split / divide
	return result
}
*/

/*
// guard를 이용한 유효성 검사 (만약 ~가 아니라면)
func division(split:Int, divide:Int) -> Int{
	// divide가 0이 아니라면 블럭을 넘어가고, 0이라면 블럭 안의 문장을 수행
	guard divide != 0 else{
		print("0으로는 나눌 수 없습니다.")
		return -1
	}
	let result = split / divide
	return result
}
print(division(split: 3, divide: 2))
print(division(split: 3, divide: 0))
*/

/*
// 운영체제 버전 확인
print(UIDevice.current.systemName)
print(UIDevice.current.systemVersion)
*/

/*
var a : Int = 10
// a = 10

// nil을 저장할 수 있는 OptionalInt 로 변수를 선언
var b : Int?
b = 20
// 출력시 b는 Optional이 붙어서 출력
print(a)
print(b)
// a는 산술 연산이 가능, b는 산술 연산이 불가능
print(a + 10)
// print(b + 10)
*/

/*
// Int 함수는 Int를 리턴하는 것이 아니고 Int?를 리턴하므로 일반적인 연산이 불가능
var n1 = Int("123")
var n2 = Int("765")
print(n1 + n2)
*/

/*
// 정수로 변환할 문자열 데이터를 2개 생성
var str1 : String = "123"
var str2 : String = "SWIFT"
// 강제로 Optional을 해제해서 연산을 수행
var result = Int(str1)! + 456
print(result)
// nil인지 확인하고 강제 형변환을 하는 것을 권장
if Int(str2) != nil{
// nil인데 강제로 Optional을 해제하므로 에러 발생
	result = Int(str2)! + 456
	print(result)
}else{
	print("데이터를 변환할 수 없어서 연산이 불가능")
}
*/

/*
var x = "256"
var y = "Swift"

// ==, != 연산자의 경우는 형변환없이 사용 가능
if Int(x) == 256{
	print("256과 일치한다.")
}else{
	print("256과 일치하지 않는다.")
}

// 변수나 상수에 대입해서 nil 여부를 판단
if let temp = Int(y){
	print("결과가 nil이 아닌 경우 수행")
}else{
	print("결과가 nil인 경우 수행")
}
*/

/*
// 배열을 생성 후 ar에 저장
var ar : Any = [30, 50]
// 데이터를 출력만 할 경우는 형변환이 불필요
print(ar)

// Any는 참조만을 저장하는 자료형이므로 데이터를 사용할 경우에는 형변환이 반드시 필요
/*
for x in ar{
	print(x)
}
*/

// 강제 형변환 ( Any, AnyObject는 NS가 붙는 Objective-C의 자료형으로 변환한 후 NS가 없는 Swift의 자료형으로 변환 필요)
/*
// 실패
var xr = ar as! Array
for x in xr {
	print(x)
}
*/
// 성공
var xr = (ar as! NSArray) as Array
for x in xr {
	print(x)
}
*/
