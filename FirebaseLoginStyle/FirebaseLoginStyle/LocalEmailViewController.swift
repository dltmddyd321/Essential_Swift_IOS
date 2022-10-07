//
//  LocalEmailViewController.swift
//  FirebaseLoginStyle
//
//  Created by 이승용 on 2022/10/06.
//

import UIKit

class LocalEmailViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.layer.cornerRadius = 30
        nextBtn.isEnabled = false
        
        emailTextField.delegate = self
        passWordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    @IBAction func tapNextBtn(_ sender: UIButton) {
    }
}

extension LocalEmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}
