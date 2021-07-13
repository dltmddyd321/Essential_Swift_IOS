import UIKit

func printName() {
    print("--> My name is Leesy")
}

printName()

func printMultipleOfTen(value : Int) {
    print("\(value) * 10 = \(value * 10)")
}

printMultipleOfTen(value: 5)


func printTotalPrice(price: Int, cnt: Int) {
    print("Total Price: \(price * cnt)")
}

printTotalPrice(price: 1500, cnt: 5)

func printTotalPriceWithDefault(price: Int = 1500, cnt: Int) {
    print("Total Price: \(price * cnt)")
}

printTotalPriceWithDefault(cnt: 5)

func totalPrice(price: Int, cnt: Int) -> Int {
    let totalPrice = price * cnt
    return totalPrice
}

let calprice = totalPrice(price: 10000, cnt: 77)

calprice

func printFullName(firstName: String, lastName: String) {
    print(" fullname is \(firstName) \(lastName)")
}

printFullName(firstName: "Jason", lastName: "LEE")

var value = 3
func incrementValue(_ value: inout Int) {
    value += 1
    print(value)
}
//inout : 파라미터 변경에 대한 필수 요소
incrementValue(&value)
