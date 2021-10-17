//
//  ViewController.swift
//  Calculator
//
//  Created by 이승용 on 2021/10/16.
//

import UIKit

enum Operation {
    case Add
    case Subtrack
    case Divide
    case Multiply
    case Unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    
    //어떤 연산자가 입력되었는지 확인하는 프로퍼티
    var currentOperation: Operation = .Unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func numberBtn(_ sender: UIButton) {
        //숫자 입력 받기(옵셔널 바인딩)
        guard let numberValue = sender.title(for: .normal) else {return}
        
        //최대 9자리까지만 입력 받기
        if self.displayNumber.count < 9 {
            //입력되는 숫자 값이 이어 붙여지고 resultLabel에 즉시 팝업
            self.displayNumber += numberValue
            self.resultLabel.text = self.displayNumber
        }
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
        //AC 버튼 클릭 시 모든 내용 초기화
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        currentOperation = .Unknown
        self.resultLabel.text = "0"
    }
    
    @IBAction func dotBtn(_ sender: UIButton) {
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.resultLabel.text = self.displayNumber
        }
    }
    
    @IBAction func devideBtn(_ sender: UIButton) {
        self.operation(.Divide)
    }
    
    @IBAction func multiplyBtn(_ sender: UIButton) {
        self.operation(.Multiply)

    }
    
    @IBAction func minusBtn(_ sender: UIButton) {
        self.operation(.Subtrack)

    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        self.operation(.Add)

    }
    
    @IBAction func resultBtn(_ sender: UIButton) {
        self.operation(self.currentOperation)

    }
    
    func operation(_ operation: Operation) {
        //아직 연산자가 지정되지 않았고
        if self.currentOperation != .Unknown {
            //결과창이 비어있을 때
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else {return}
                guard let secondOperand = Double(self.secondOperand) else {return}
                
                switch self.currentOperation {
                case .Add :
                    self.result = "\(firstOperand + secondOperand)"
                case .Subtrack :
                    self.result = "\(firstOperand - secondOperand)"
                case .Divide :
                    self.result = "\(firstOperand / secondOperand)"
                case .Multiply :
                    self.result = "\(firstOperand * secondOperand)"
                    
                default :
                    break
                }
                
                //truncatingRemainder : 나머지 연산
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                
                self.firstOperand = self.result
                self.resultLabel.text = self.result
            }
            
            self.currentOperation = operation
            
        } else {
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
}

