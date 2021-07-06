//
//  ViewController.swift
//  RainbowTab
//
//  Created by 이승용 on 2021/07/05.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBarItem.badgeValue = "1"
    }

    override func viewDidAppear(_ animated: Bool) { //뱃지 알림 꺼짐
        super.viewDidAppear(animated)
        tabBarItem.badgeValue = nil
    }

}

