//
//  ViewController.swift
//  TrafficSegue
//
//  Created by 이승용 on 2021/07/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToRed(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    } //돌아가는 길을 기억하고 있는 세그웨이
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = textField.text
        //내비게이션의 타이틀이 가지고 있는 내용을 텍스트 필드의 텍스트 값으로 삽입
    }

}

