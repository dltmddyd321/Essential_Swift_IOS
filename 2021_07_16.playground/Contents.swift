import UIKit

var scoreDic: Dictionary<String, Int> = ["Jason": 80, "Jay":95, "Jake": 90]

if let score = scoreDic["Jason"] {
    score
} else {
    //None
}

scoreDic.isEmpty
scoreDic.count

for (name,score) in scoreDic {
    print("\(name), \(score)")
}

for key in scoreDic.keys {
    print(key)
}

var myDic: [String: String] = ["name":"Jason", "job":"iOS Engineer", "city":"Seoul"]

myDic["city"] = "Busan"
myDic

func printNameAndCity(dic: [String: String]) {
    if let name = dic["name"], let city = dic["city"] {
        print(name,city)
    } else {
        print("None")
    }
}

printNameAndCity(dic: myDic)


var someSet: Set<Int> = [1,2,3,1]
//{~,~,~}
//중복 없음

someSet.isEmpty
someSet.count


var multiplyClosure: (Int,Int) -> Int = { $0 * $1 }

let result = multiplyClosure(4,2)

func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a,b)
    return result
}

operateTwoNum(a: 4, b: 2, operation: multiplyClosure)

var addClosure: (Int, Int) -> Int = { a, b in
    return a + b
}

operateTwoNum(a: 4, b: 2, operation: addClosure)

let voidClosure: () -> Void = {
    print("iOS 개발자")
}

voidClosure()

var count = 0

let incrementer = {
    count += 1
}

incrementer()
incrementer()
incrementer()
incrementer()

count

//First Class Type
//1. 변수에 할당 가능
//2. 인자로 받기 가능
//3. return 가능

/*
{ (param) -> return type in
    statement
    ...
}
*/

//Simple Closure
let simpleClosure = {
}

simpleClosure()


//코드블록을 구현한 Closure

let incodeSimpleClosure = {
    print("Hello!!")
}

incodeSimpleClosure()


//Input 파라미터를 받는 Closure
let inputSimpleClosure:(String) -> Void = { name in
    print("Hello!! My name is \(name).")
}

inputSimpleClosure("방역")

//값을 리턴하는 Closure

let returnSimpleClosure:(String) -> String = { name in
    
    let msg = "iOS 개발자, \(name)님 안녕하세요?"
    return msg
}

returnSimpleClosure("이승용")

//Closure를 파라미터로 받는 함수

func someSimpleFunction(testClosure: () -> Void) {
    print("함수에서 호출")
    testClosure()
    //Closure를 추가로 호출해야함
}

someSimpleFunction(testClosure: {
    print("만나뵙게 되어 반갑습니다.")
})


//Trailing Closure

func trailingFunction(message: String, testTrailingClosure:() -> Void) {
    print("함수에서 호출, messagen = \(message)")
    testTrailingClosure()
}

trailingFunction(message: "건강이 제일입니다.", testTrailingClosure: {
    print("날씨가 많이 덥네요")
})

trailingFunction(message: "건강이 제일입니다.") {
    print("날씨가 많이 덥네요")
}

