//
//  ViewController.swift
//  test1
//
//  Created by 이승용 on 2021/07/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        //버튼 연결 기능 구현
        //#selector : 메서드를 가리킴
    }

    @IBAction func buttonTapped(_ sender: Any) {
        print("Button was tapped!!")
        
        if toggle.isOn{
            print("ON")
        }else {
            print("OFF")
        }
        
        print("The slider is set to \(slider.value)")
    }
    
    @IBAction func switchedToggled(_ sender: UISwitch) {
        
        if sender.isOn {
            print("ON")
        }else{
            print("OFF")
        }
    }
    
    @IBAction func slideValueChange(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func keyboardReturn(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
        //기본 view에 대해 클릭을 통하여 x,y 좌표 값 출력
    }
    
}

