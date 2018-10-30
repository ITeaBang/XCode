import UIKit
/*
var str = "Hello, playground"
var i = 10

prin
t(str)
*/

/*
// 정수 변수 n을 생성, 54를 대입
var n : Int = 54
print(n)
n = 76
print(n)

// 상수 t를 생성, 77을 대입
let t : Int = 77

// 상수는 값을 변경 불가능, 에러 발생
t = 87
*/

/*
var x : Int = 45
// Swift는 초기 변수 선언시 자료형이 결정되면 다른 종류의 데이터는 저장 불가능
// x = 3.4
*/

/*
// 자료형 별명 만들기
typealias Integer = Int
var y : Integer = 45
debugPrint(y)
*/

/*
// 변수를 선언시 자료형을 기재하는 것을 타입 어노테이션
var d : Double = 3.76521

// 변수를 선언시 자료형을 기재하지 않고 데이터를 대입해서 Swift가 자료형을 결정하도록 만드는 것은 타입 추론
var f = 2.7876
*/

/*
// x, y의 값을 포함해서 x : x의 값, y : y의 값 형식의 문자열 생성
var x = 30
var y = 40

var message = "x:\(x) y:\(y)"
print(message)

// 여러 줄의 문자열 저장
var multiStr =
"""
안녕하세요.
반갑습니다.
"""
print(multiStr)
*/

// 타입 어노테이션을 이용한 변수 생성
var n1 : Int8 = 10
var n2 : Int32 = 26

// 타입 추론을 이용한 변수 생성 - 형변환 없이 연산시 에러 발생
// var result = n1 + n2

// n1의 자료형을 Int32로 변경해서 연산 수행
var result = Int32(n1) + n2

print("결과 : \(result)")
print(result is Int8)
print(result is Int32)
