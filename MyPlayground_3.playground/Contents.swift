import UIKit

/*
// 문자열 배열 생성
var ar = ["JAVA", "JAVA Script", "Swift"]

// 배열의 모든 데이터 접근 - 반복문을 이용한 접근
// 반복문 안에서 객체의 속성을 계속 접근하는 경우, 미리 다른 변수에 저장해두고 사용하면 접근 속도가 빨라진다.
/*
var len = ar.count
var idx = 0
while idx < len {
print(ar[idx])
idx = idx + 1
}
print("============")
*/

// [인덱스]를 이용하는 경우는 시작 위치부터 인덱스만큼 이동해서 데이터를 찾아오는 것이고
// iterator를 이용하는 경우는 순서대로 위치를 이동하면서 데이터를 찾아오는 것이다.
// 따라서 데이터 전체를 순서대로 접근하는 방식에서는 iterator가 효율적이다.
// iterator를 이용하는 방법
for temp in ar{
print(temp)
}
print("============")

// 마지막 위치에 데이터를 추가
ar.append("Python")

// 0번째 위치에 데이터를 추가
ar.insert("C", at: 0)

// 2번째 위치의 데이터를 삭제
ar.remove(at: 2)
for temp in ar{
print(temp)
}
*/

/*
var ar = [30, 20, 54, 63, 26]

// 모든 데이터에 1씩 더해주는 작업
var result = ar.map({(x : Int) -> (Int) in return x + 1})
print(result)

// 홀수만 골라내는 작업
result = ar.filter({(x : Int) -> (Bool) in return x % 2 != 0 })
print(result)
*/

/*
// Tuple 생성
var tuple = ("bang", 92)

// Tuple의 데이터 접근
print(tuple.0, ":", tuple.1)

// Tuple에 이름 부여
var person = (name : "을지문덕", job : "army")
print(person.name, ":", person.job)

// Tuple은 분리해서 저장이 가능
var(name, job) = person
print(name, ":", job)
var a : Int = 98
var b : Int = 77

/*
var temp : Int = a

// a와 b에 저장된 데이터의 값을 교환
a = b
b = temp
*/
(a, b) = (b, a)
print("a = \(a), b = \(b)")
*/

/*
// 이름과 직업을 하나로 묶어서 저장
var person = ["name":"양만춘", "job":"army"]

// 개별 데이터 접근 - 기본적으로 Optional 적용
print("\(person["name"]) : \(person["job"])")

// 데이터 추가, 수정
person["nation"] = "고구려"
person["job"] = "soldier"
print("\(person["name"]) : \(person["job"]) : \(person["nation"])")

// 모든 데이터 접근 : 모든 데이터를 Tuple로 만들어서 접근
for t in person{
print(t)
}

// 이름 - 문자열, 나이 - 정수 형태의 데이터를 하나의 Dictionary에 저장
var dict : Dictionary<String, Any> = [:]
dict["name"] = "강감찬"
dict["age"] = 54
print(dict)

// 이름을 문자열로 변환해서 출력
print(dict["name"] as! String)

// 나이를 정수로 변환해서 출력
print(dict["age"] as! Int + 3)
*/
