import UIKit

var greeting = "Hello, playground"
print(greeting)

var myArray = [Int](repeating: 0, count: 100)

var day = ["J":31, "F":28, "M":31]

day["A"] = 30 //A 값이 딕셔너리에 추가
print(day)

let cadence: Double = 180
var testSteps = 0

for i in 1...10 {
    print("Take a Step")
    Thread.sleep(forTimeInterval: 60/cadence) // 60/180의 간격으로 print 동작 실행
}
