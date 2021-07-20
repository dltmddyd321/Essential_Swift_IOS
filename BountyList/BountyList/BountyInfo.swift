//
//  BountyInfo.swift
//  BountyList
//
//  Created by 이승용 on 2021/07/20.
//

import UIKit

struct BountyInfo { //Model 선언
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name:String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
