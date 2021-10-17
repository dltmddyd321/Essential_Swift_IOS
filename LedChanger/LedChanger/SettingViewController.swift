//
//  SettingViewController.swift
//  LedChanger
//
//  Created by 이승용 on 2021/10/16.
//

import UIKit

//값을 전달하고 관리하기 위한 프로토콜 선언
protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    //버튼 자체의 속성도 변경해야해서 버튼 아웃렛 선언
    @IBOutlet weak var orangeBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var purpleBtn: UIButton!
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate : LEDBoardSettingDelegate?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    var ledText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    //기존 설정 값을 설정 창으로 호출하기 위한 함수
    private func configureView() {
        if let ledText = self.ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColor(color: self.backgroundColor)
    }
    
    //3개의 텍스트 색상 변경 버튼 기능을 한 묶음으로 정의
    @IBAction func textColorBtn(_ sender: UIButton) {
        if sender == self.yellowBtn {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.purpleBtn {
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        } else {
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }
    
    //3개의 배경 색상 변경 버튼 기능을 한 묶음으로 정의
    @IBAction func backgroundColorBtn(_ sender: UIButton) {
        if sender == self.blackBtn {
            self.changeBackgroundColor(color: .black)
            self.backgroundColor = .black
        } else if sender == self.blueBtn {
            self.changeBackgroundColor(color: .blue)
            self.backgroundColor = .blue
        } else {
            self.changeBackgroundColor(color: .orange)
            self.backgroundColor = .orange
        }
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        //delegate를 통해 사용자가 지정한 설정 값이 반환
        self.delegate?.changedSetting(text: self.textField.text, textColor: self.textColor, backgroundColor: self.backgroundColor)
        
        //이전 화면으로 이동
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color: UIColor) {
        //참이면 alpha 값 1, 거짓이면 0.2 -> 삼항 연산자
        self.yellowBtn.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleBtn.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenBtn.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    private func changeBackgroundColor(color: UIColor) {
        self.blackBtn.alpha = color == UIColor.black ? 1: 0.2
        self.blueBtn.alpha = color == UIColor.blue ? 1: 0.2
        self.orangeBtn.alpha = color == UIColor.orange ? 1: 0.2
    }
}
