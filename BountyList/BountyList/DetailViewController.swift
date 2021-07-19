//
//  DetailViewController.swift
//  BountyList
//
//  Created by 이승용 on 2021/07/19.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        //close 버튼을 누르면 해당 레이아웃 꺼짐
    }
    
}
