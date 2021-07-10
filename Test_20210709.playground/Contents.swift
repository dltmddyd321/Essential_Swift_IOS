import UIKit

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

