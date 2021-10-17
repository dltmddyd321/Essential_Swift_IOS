//
//  RoundBtn.swift
//  Calculator
//
//  Created by 이승용 on 2021/10/16.
//

import UIKit

@IBDesignable
class RoundBtn: UIButton {
    
    @IBInspectable var isRound: Bool = false {
        //프로퍼티의 값이 변경된 후에 호출
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }

}
