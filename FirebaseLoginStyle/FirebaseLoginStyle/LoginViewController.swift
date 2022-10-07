//
//  LoginViewController.swift
//  FirebaseLoginStyle
//
//  Created by 이승용 on 2022/10/06.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailLoginBtn: UIButton!
    @IBOutlet weak var googleLoginBtn: UIButton!
    @IBOutlet weak var appleLoginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [emailLoginBtn, googleLoginBtn, appleLoginBtn].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    
    @IBAction func tapGoogleLoginBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func tapAppleLoginBtn(_ sender: UIButton) {
    }
}
