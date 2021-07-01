//
//  LABViewController.swift
//  test1
//
//  Created by 이승용 on 2021/07/01.
//

import UIKit

class LABViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func setTextBtn(_ sender: Any) {
        if let inputText = textField.text {
            textLabel.text = inputText
        }
        textField.resignFirstResponder()
        //키보드가 아래로 내려감
    }
    
    @IBAction func setTextClear(_ sender: Any) {
        textLabel.text = ""
        textField.resignFirstResponder()
    }
    

}
