import UIKit

struct Store {
    let loc: Int
    var name: String
    let distance = 2.0
    //Stored Property
    
    //var description = String {
    //    return "Title: \(name)"
    //}
    //Computed Property
}

struct Person {
    var fisrtName: String {
        didSet {
            print("didset: \(oldValue) -> \(fisrtName)")
        }
        //변수의 갱신 과정을 확인 가능
    }
    var lastName: String
    
    lazy var isPopular:Bool = {
        if fullName == "Jay Park" {
            return true
        } else {
            return false
        }
    }()

    var fullName: String {
        get{
            return "\(fisrtName) \(lastName)"
        }
        set{
            if let firstName = newValue.components(separatedBy: " ").first {
                self.fisrtName = firstName
            }
            
            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
            //String 요소를 " "으로 구분하여 잘라낸 뒤 첫 번째 값과 마지막 값을 변수에 각각 할당
        }
    }//Computed Property
    
    
    static let isAlien: Bool = false
}

var person = Person(fisrtName: "Lee", lastName: "SY")

person.fisrtName
person.lastName
person.fullName

//Property : 호출 시 저장된 값을 하나 반환
//Method : 호출 시 어떤 작업을 수행

struct Lecture {
    var title: String
    var maxStudents: Int = 10
    var numOfRegistered: Int = 4
    
    func remainSeats() -> Int {
        let remainSeats = maxStudents - numOfRegistered
        return remainSeats
    }
    
    mutating func register() {
        numOfRegistered += 1
    }
    //메소드 내부의 변수 초기값을 하위 함수에서 변경시킬때 mutating 지정
    
    static let target: String = "Anybody want to learn something"
    
    static func schoolName() -> String {
        return "패스트 캠퍼스"
    }
}

var lec = Lecture(title: "iOS Basic")

lec.remainSeats()

lec.register()


struct Math {
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}

Math.abs(value: -20)

//메소드에 필요한 요소를 확장
extension Math {
    static func sqaure(value: Int) -> Int {
       return value * value
    }
    
    static func half(value: Int) -> Int {
        return value/2
    }
}

Math.sqaure(value: 10)
Math.half(value: 42)

var value: Int = 3

extension Int {
    func sqaure() -> Int {
        return self * self
    }
    
    func half() -> Int {
        return self/2
    }
}

value.sqaure()
value.half()
