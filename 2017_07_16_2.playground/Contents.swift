import UIKit

struct Lecture {
    let name:String
    let instructor: String
    let numOfStudent : Int
}

func printLectureName(from instructor : String, lectures: [Lecture]) {
//    var lectureName = ""
//
//    for lecture in lectures {
//        if instructor == lecture.instructor {
//            lectureName = lecture.name
//        }
//    }
    
    let lectureName = lectures
        .first {$0.instructor == instructor
        }?.name ?? ""
    //$0 -> 아이템을 한 개씩 가져옴
    //?? "" -> Default 값이면 빈 문자열
    
    print("그 강사님 강의는 : \(lectureName)")
}

let lec1 = Lecture(name: "iOS Basic", instructor: "Jason", numOfStudent: 15)
let lec2 = Lecture(name: "iOS Advanced", instructor: "Mike", numOfStudent: 12)
let lec3 = Lecture(name: "iOS Pro", instructor: "Anna", numOfStudent: 7)

let lectures = [lec1, lec2, lec3]

printLectureName(from: "Mike", lectures: lectures)
