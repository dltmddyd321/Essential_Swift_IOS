import UIKit

struct PersonStruct {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    mutating func uppercaseName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

class PersonClass {
    var firstName: String
    var lastName: String
    
    init(firstName :String, lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    func uppercaseNamed() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

var personStruct1 = PersonStruct(firstName: "Jason", lastName: "Lee")
var personStruct2 = personStruct1

var personClass1 = PersonClass(firstName: "Jason", lastName: "Lee")
var personClass2 = personClass1

personStruct2.firstName = "Jay"
personStruct1.firstName
personStruct2.firstName
//struct는 1과 2 다름

personClass2.firstName = "Jay"
personClass1.firstName
personClass2.firstName
//class는 1과 2 같음

personClass2 = PersonClass(firstName: "Bob", lastName: "Lies")
personClass1.firstName
personClass2.firstName
//새로운 인스턴스를 지시하여 1과 2가 다름

personClass1 = personClass2
personClass1.firstName
personClass2.firstName
//1과 2 모두 새로운 인스턴스를 반환

//Class 타입을 사용해야 할 경우
//1. 2개 오브젝트 인스턴트 자체가 같음을 확인해야 할 때
//2. 하나의 객체가 필요하고, 여러 대상에 의해 접근되고 변경이 필요한 경우

struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName:String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

class Student:Person {
    var grades: [Grade] = []
}

let jay = Person(firstName: "Jay", lastName: "Park")
let kan = Student(firstName: "Kan", lastName: "Alex")

jay.firstName
kan.firstName

jay.printMyName()
kan.printMyName()

let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 10.0, credits: 3)
kan.grades.append(math)
kan.grades.append(history)

kan.grades.count


//상속의 규칙
//1. 자식은 1개의 수퍼클래스만 상속 가능
//2. 부모는 여러 자식 클래스를 가질 수 있음
//3. 상속의 깊이에는 제한 없음

class StudentAthelete: Student {
    var minimunTrainingTime: Int = 2
    var trainedTime: Int = 0
    var sports: [String]
    
    init(firstName: String, lastName: String, sports: [String]) {
        //Phase 1
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
        
        //Phase 2
        self.train()
    }
    
    convenience init(name: String) {
        self.init(firstName: name, lastName: "", sports: [])
    }
    
    func train() {
        trainedTime += 1
    }
}

class FootballPlayer: StudentAthelete {
    var footballTeam = "FC Swift"
    
    override func train() {
        trainedTime += 2
    }
}

//var athelete1 = StudentAthelete(firstName: "Yuna", lastName: "Kim")
//var athelete2 = FootballPlayer(firstName: "Heung Min", lastName: "Son")

//athelete1.firstName
//athelete2.firstName
//
//athelete1.grades.append(math)
//athelete2.grades.append(math)
//
//athelete1.minimunTrainingTime
//athelete2.minimunTrainingTime
//
//athelete2.footballTeam
//
//athelete1.train()
//athelete1.trainedTime
//
//athelete2.train()
//athelete2.trainedTime
//
//athelete1 = athelete2 as StudentAthelete
//athelete1.train()
//athelete1.trainedTime
//
//if let son = athelete1 as? FootballPlayer {
//    print("--> team:\(son.footballTeam)")
//}

let student1 = Student(firstName: "Jason", lastName: "Lee")
let student2 = StudentAthelete(firstName: "Jay", lastName: "Lee", sports: ["FootBall"])
let student3 = StudentAthelete(name: "Mike")

//클래스 상속은 언제 사용하는가?
//1. Single Responsibility
//2. Type Safety
//3. Shared Base Classes
//4. Extensibility
//5. Identity
