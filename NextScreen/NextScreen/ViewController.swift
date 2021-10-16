//
//  ViewController.swift
//  NextScreen
//
//  Created by 이승용 on 2021/10/15.
//

import UIKit

class ViewController: UIViewController, SendDataDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabCodePushBtn(_ sender: UIButton) {
        //인스턴스화를 위한 옵셔널 바인딩 처리
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") as? CodePushViewController else {
            return
        }
        viewController.name = "Gunter"

        //옵셔널 바인딩 요소를 담아 화면 전환 구현
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tabCodePresentBtn(_ sender: Any) {
        
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresent") as? CodePresentViewController else {
            return
        }
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.name = "Gunter"
        
        //값 받아오기
        viewController.delegate = self
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //전환하려는 인스턴스의 ViewController 호출
        if let viewController = segue.destination as? SeguePushViewController {
            viewController.name = "Gunter"
        }
    }
    
    func sendData(name : String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
}

