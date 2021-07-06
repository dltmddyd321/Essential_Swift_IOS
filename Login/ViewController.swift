//
//  ViewController.swift
//  Login
//
//  Created by 이승용 on 2021/07/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forgotUserNameBtn: UIButton!
    
    @IBOutlet weak var forgotUserPwBtn: UIButton!
    
    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func forgotUserName(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUserNameorPassword", sender: forgotUserNameBtn)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUserNameorPassword", sender: forgotUserPwBtn)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else{
            return
        }
        
        if segue.identifier == "ForgottenUserNameorPassword" {
            if sender == forgotUserNameBtn {
                segue.destination.navigationItem.title = "Forgot UserName"
            } else if sender == forgotUserPwBtn {
                segue.destination.navigationItem.title = "Forgot Password"
            }
        }else {
            segue.destination.navigationItem.title = self.userNameField.text
        }
    }

}

