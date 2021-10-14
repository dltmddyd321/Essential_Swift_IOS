//
//  ViewController.swift
//  AutoLayout
//
//  Created by 이승용 on 2021/10/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func changeColorBtn(_ sender: UIButton) {
        self.colorView.backgroundColor = UIColor.blue
        print("색상 변경 버튼 클릭!")
        //상단에서 선언한 colorView의 색상을 버튼 클릭 시 파랑색으로 변경
    }
}

