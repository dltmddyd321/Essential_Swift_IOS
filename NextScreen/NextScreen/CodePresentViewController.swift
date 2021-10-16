//
//  CodePresentViewController.swift
//  NextScreen
//
//  Created by 이승용 on 2021/10/15.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name : String?
    
    //delegate 사용 시 메모리 누수를 방지하기 위해 반드시 weak 추가
    weak var delegate: SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tabBackBtn(_ sender: UIButton) {
        self.delegate?.sendData(name: "Gunter")
        //Present에서의 뒤로 가기 버튼 구현
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
