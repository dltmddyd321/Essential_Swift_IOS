//
//  ViewController.swift
//  LedChanger
//
//  Created by 이승용 on 2021/10/16.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate{

    @IBOutlet weak var contentsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //초기 색상 지정
        self.contentsLabel.textColor = .yellow
    }
    
    //Segue로 화면 전환 시 데이터 받는 쪽에서는 prepare 사용
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //다운 캐스팅을 통해 delegate를 호출
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
            settingViewController.ledText = self.contentsLabel.text
            settingViewController.textColor = self.contentsLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }
    
    //delegate에 포함된 함수를 호출하여 값 연결
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        
        //값 유무 파악에 따른 옵셔널 바인딩
        if let text = text {
            self.contentsLabel.text = text
        }
        
        //TextColor와 BackgroundColor는 이미 초기 값이 설정 -> 옵셔널 바인딩 X
        self.contentsLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }

}

