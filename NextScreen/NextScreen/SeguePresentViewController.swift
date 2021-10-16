//
//  SeguePresentViewController.swift
//  NextScreen
//
//  Created by 이승용 on 2021/10/15.
//

import UIKit

class SeguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func tabBackBtn(_ sender: UIButton) {
        //Present Modal로 연결 시 뒤로 가기 버튼 구현
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
