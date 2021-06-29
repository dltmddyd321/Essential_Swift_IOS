//
//  ViewController.swift
//  essential_1
//
//  Created by 이승용 on 2021/06/29.
//

import UIKit

class ViewController: UIViewController {
    
    var myNum = 10
    //1010
    
    var myChar1 = "\u{0058}"
    //유니코드의 코드 포인트를 이용하여 변수에 'X' 문자 할당
    
    //print("Int32 Min = \(Int32.min) Int32 Max = \(Int32.max)")
    // -> Int32 Min = -2147483648 Int32 Max = 2147483647
    
    //문자열 보간
    var userName = "John"
    var inboxCount = 25
    let maxCount = 100
    
    /* var message = "\(userName) has \(inboxCount) messages. Messsage capacity remaining is \(maxCount - inboxCount) messages." */
    // print(message) -> John has 25 messages. Message capacity remaining is 75 messages.
    
    var userCount = 10
    //일반적인 변수 선언
    
    let maxUserCount = 10
    //일반적인 상수 선언
    
    var userCount2: Int = 105
    //정수형 타입 선언 (: ~)
    
    let myName = "LeeSY"
    //타입 선언 없이 상수를 선언할 때는 반드시 선언 시점에 값을 할당.
    
    let bookTitle: String
    //상수 선언 시 타입 선언 후 활용 예시
    /* if iosBookType {
        bookTitle = "SwiftUI"
    } else {
        bookTitle = "Android"
    } */

    let myTuple = (10, 432.432, "this")
    //튜플 선언 및 사용 방법

    let myTuple1 = (count : 10, length : 432.432, msg : "hello")
    //튜플을 생성하는 시점에서 각각의 값을 변수에 할당
    
    var index: Int?
    //스위프트 옵셔널 타입 : 변수 또는 상수 값이 할당되지 않은 상황을 처리하기 위한 접근 방식
    //어떤 값도 할당되지 않은 옵셔널은 실제로 nil 값을 가짐
    //만약 옵셔널에 값이 할당되었다면 해당 값이 옵셔널 내에서 '래핑되었다'고 표현
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myString = myTuple.2
        print(myString) // -> this 출력
        
        //var (myInt,_,myString) = myTuple
        //원하지 않는 값 자리에 _를 쓰면 해당 값 무시
        
        print(myTuple1.msg) // -> hello 출력
        
        index = 3
        var treeArray = ["Oak", "Pine", "Yew", "Birch"]
        
        if index != nil {
            print(treeArray[index!])
        } else {
            print("index does not contain a value")
        }
        //만약 index 옵셔널 변수에 값이 할당되면 배열의 해당 위치에 있는 나무 이름이 콘솔에 출력
        //index 변수가 옵셔널 타입이기 때문에 변수명 뒤에 느낌표를 두어 값 언래핑
        
        //if let constantname = optionalName {
            //지정된 옵셔널이 값을 가지고 있는지를 확인하는 작업
        //}
        
        //if var variablename = optionalName {
            //옵셔널 변수가 값을 가지고 있는 경우 선언된 상수 또는 변수에 그 값을 할당하고 코드 실행
        //}
        
    }


}

