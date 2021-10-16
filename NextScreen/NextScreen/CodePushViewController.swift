//
//  CodePushViewController.swift
//  NextScreen
//
//  Created by 이승용 on 2021/10/15.
//

import UIKit

class CodePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //name을 실제 라벨에 배치
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    
    @IBAction func tabBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
