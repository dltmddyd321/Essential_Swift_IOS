import UIKit
import Foundation

var someInt: Int = -100
someInt = 100

//부호가 없는 정수형 저장
var someUInt: UInt = 200

var someFloat: Float = 1.1
someFloat = 1

var someDouble: Double = 1.1
someDouble = 1

var someBool: Bool = true

var someChar: Character = "가"
someChar = "A"
someChar = "📚"

var someStr: String = "안녕하세요."

var number = 10

//Int형 배열을 선언하고 1이라는 요소 추가
var numbers : Array<Int> = Array<Int>()
numbers.append(1)
numbers.append(3)

numbers[1]

//값 4를 2번 인덱스에 삽입
//2번 인덱스에 기존에 있던 데이터는 다음 인덱스로 이동
numbers.insert(4, at: 2)
numbers

numbers.remove(at: 0)
numbers

//축약된 형태의 Array 선언
var names: [String] = []

//Dictionary 선언
var dic: Dictionary<String, Int> = Dictionary<String, Int>()

//축약된 형태의 Dictionary 선언
var dic2 : [String: Int] = ["권태완": 1]
dic2["이승용"] = 3
dic2["김연아"] = 5
dic2

dic2["김연아"] = 7
dic2

dic2.removeValue(forKey: "이승용")
dic2

//Set에는 축약형 없음
//순서가 없으며 중복 불가
var set: Set = Set<Int>()

set.insert(10)
set.insert(20)
set.insert(30)
set.insert(30)
set

//오름차순 정렬
set.sorted()

set.remove(20)
set

/*
func 함수명(파라미터 명 : 데이터 타입) -> 반환 타입 {
    return 반환 값
}
*/

func sum(a: Int, b:Int) -> Int {
    return a+b
}

sum(a: 3, b: 5)

func hello() -> String {
    return "hello"
}

hello()

func greeting(friend: String, me: String = "Jason") {
    print("Hello, \(friend)! I'm \(me)")
}

greeting(friend: "Lee")

//코드의 가독성을 높이는 매개변수 지정 함수 구조 -> 전달 인자 레이블
func sendMsg(from myName: String, to name: String) -> String {
    return "Hello \(name)! I'm \(myName)"
}

sendMsg(from: "Jason", to: "Lee")

func sendMsg2(_ myName: String) -> String {
    return "Hello \(myName)!"
}

sendMsg2("이승용")

//가변 매개변수를 사용한 함수 구조
func sendMsg3(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)"
}

sendMsg3(me: "Lee", friends: "Kan", "Alan", "Stella")

