import UIKit

var greeting = "Hello, playground"


func add(_ a : Int, _ b: Int) -> Int {
    return a+b
}

func subtract(_ a:Int, _ b:Int) -> Int {
    return a-b
}

var function = add
//함수 자체를 변수에 할당 가능
function(4,2)


func printResult(_ function: (Int,Int) -> Int, _ a:Int, _ b:Int) {
    let result = function(a,b)
    print(result)
}
//활용 시 함수의 타입은 같아야 함

printResult(add, 10, 5)

//Optional
var carName: String? = "Tesla"
carName = nil
//carName = "Carnival"

let num = Int("10")

//고급 기능 4가지
//1. Fored unwrapping -> 강제로 박스 해체
//2. Optional binding (if let) -> 유연하게 박스 해체
//3. Optional binding (guard) -> 유연하게 박스 해체
//4. Nil coalescing -> 박스 해체 후, 값이 없다면 Default값 반환

//print(carName!)

if let unwrappedCarName = carName {
    print(unwrappedCarName)
} else {
    print("None")
}

func printParsedInt(from: String) {
    if let parseInt = Int(from) {
        print(parseInt)
        if parseInt > 0{
            print(parseInt)
        } else{
            
        }
    } else {
        print("XXX")
    }
}

//printParsedInt(from: "Hello")
printParsedInt(from: "9434")


let likeFoode: String? = "햄버거"

if let foodName = likeFoode {
    print(foodName)
} else {
    print("None")
}


func printNickName(name: String?) {
    guard let nickName = name else {
        //값이 nil이라면
        print("nickName 만들기")
        return
    }
    print(nickName)
}

printNickName(name: "LeeSY")


//Array
var evenNums: [Int] = [2, 4, 6, 8]

evenNums.append(10)
evenNums += [12, 14, 16]
evenNums.append(contentsOf: [18,20])

let isEmpty = evenNums.isEmpty
//비어있는지 판별

evenNums.count
//요소의 개수

if let firstItem = evenNums.first{
    print("--> first item is : \(firstItem)")
}

evenNums.min()
evenNums.max()

var firstItem = evenNums[0]
var secondItem = evenNums[1]
var tenthItem = evenNums[9]

let firstThree = evenNums[0...2]

evenNums.contains(3)
//3이라는 요소가 있는지 여부

evenNums.insert(0, at: 0)

evenNums.remove(at: 1)

evenNums[0...2] = [-2,0,2]
//앞의 3개 요소가 -2, 0, 2로 교체
evenNums

evenNums.swapAt(0, 1)
//0번과 1번 인덱스 요소 교체

for (index, num) in evenNums.enumerated() {
    print("index: \(index), value: \(num)")
}
//순서쌍으로 인덱스와 값을 모두 출력

evenNums.dropFirst(3)
//실제로 값이 삭제되는 것이 아니라 앞의 3개 값을 제외하고 나머지 배열 값들을 반환
evenNums

evenNums.prefix(3)
//앞의 3개 값만 반환

