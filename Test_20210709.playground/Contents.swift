import UIKit
import Foundation

var greeting = "Hello, playground"
print(greeting)

let value = arc4random_uniform(100)
print("--> \(value)")

//Tuple
let coordinates = (4,6)

let x = coordinates.0
let y = coordinates.1

let coordinatesNamed = (x:2,y:3)
let a = coordinatesNamed.x
let b = coordinatesNamed.y

let (x3, y3) = coordinatesNamed
x3
y3

let yes = true
let no = false

let numBool = 5>8 //false

if numBool { //참일 경우
    print("참")
} else { //거짓일 경우
    print("거짓")
}

let name1 = "Joan"
let name2 = "Lisa"

let isSameName = name1 == name2 //false
let isSameLength = name1.count == name2.count //true

let name3 = "Jin"
let name4 = "Jason"

let isJason = name4 == "Jason"
let isMale = false

let jasonAndMale = isJason && isMale //false
let jasonOrMale = isJason || isMale //true

let greetingMsg: String

if isJason {
    greetingMsg = "Hello Jason"
} else {
    greetingMsg = "Hello Somebody"
}
print("Msg : \(greetingMsg)")

let greetingMsg2: String = isJason ? "Hello Jason" : "Hello Somebody" //3항 연산자 구문
print("Msg : \(greetingMsg)")

var hours = 50
let payPerHour = 10000
var salary = 0

if hours > 40 {
    let extreHours = hours - 40
    salary += extreHours * payPerHour * 2
    hours -= extreHours
}
// scope의 변수, 상수는 외부에서 사용 불가

salary += hours * payPerHour

var i = 0
while i<10 {
    print(i)
    
    if i == 5 {
        break
    }
    i += 1
}

i = 0
repeat {
    print(i)
    i += 1
} while i<10

//while
//조건 -> 코드 수행 -> 조건 -> 코드 수행

//repeat
//코드 수행 -> 조건 -> 코드 수행 -> 조건

let closedRange = 0...10
let halfClosedRange = 0..<10

var sum = 0
for i in closedRange {
    print("--> \(i)")
    sum += i
}

print("--> total sum : \(sum)")

var sinValue: CGFloat = 0
for i in closedRange {
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
    //그래프 생성
}

let name5 = "Jason"
for _ in closedRange {
    print("--> name: \(name5)")
}

for i in closedRange {
    if i % 2 == 0{
        print("--> 짝수: \(i)")
    }
}

for i in closedRange where i % 2 == 0 {
    print("--> 짝수: \(i)")
}

for i in closedRange {
    if i == 3{
        continue
        //3이면 건너뜀
    }
    print("--> \(i)")
}

for i in closedRange {
    for j in closedRange {
        print("gugudan -> \(i) * \(j) = \(i*j)")
    }
}

let num = 10

switch num {
case 0:
    print("값 : 0")
case 0...10:
    print("0~10 사이")
case 10:
    print("값 : 10")
default:
    print("나머지")
}

let num2 = 5
switch num2 {
case _ where num2 % 2 == 0:
    print("짝수")
default:
    print("홀수")
}


let coordinate2 = (x:0, y:10)

switch coordinate2 {
case (0,0):
    print("원점입니다.")
case (_,0):
    print("x축입니다.")
case (0,_):
    print("y축입니다.")
default:
    print("좌표 어딘가")
}
