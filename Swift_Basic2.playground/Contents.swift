import UIKit

let temp = 30

switch temp {
case -20 ... 9:
    print("겨울")
case 10...14:
    print("가을")
case 15...25:
    print("봄")
case 26...35:
    print("여름")
default:
    print("이상 기후")
}

/*
 for 루프상수 in 순회대상 {
    //실행 구문
 }
 */

for i in 1...4 {
    print(i)
}

let array = [1,2,3,4,5]

for i in array {
    print(i)
}

var x = 6

//조건과 맞지 않아도 반드시 실행 구문이 1번은 실행
repeat {
    x += 2
} while x < 5

print(x)

var name: String?

//옵셔널 변수는 옵셔널 바인딩 과정을 거쳐야 사용 가능
var optinalName: String? = "Hello"

var number: Int? = 3
print(number)

// ! : 옵셔널 강제 해제
print(number!)

//옵셔널을 해제하기 위한 할당 if 구문
if let result = number {
    print(result)
}


//guard 구문을 통한 옵셔널 바인딩
func test() {
    let number: Int? = 5
    guard let result = number else { return }
    print(result)
}

test()

//비교연산자로 계산 시 컴파일러가 자동으로 옵셔널 해제
let value: Int? = 6
if value == 6 {
    print("value가 6입니다.")
} else {
    print("value가 6이 아닙니다.")
}

//묵시적 옵셔널 해제
let string = "12"
var stringToInt : Int? = Int(string)
