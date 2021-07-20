//
//  DetailViewController.swift
//  BountyList
//
//  Created by 이승용 on 2021/07/19.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MVVM
    
    //Model
    // - BountyInfo
    
    //View
    // - imgVIew, nameLabel, bountyLabel
    
    //ViewModel
    // - DetailViewModel
    // - BountyViewModel을 만들고, ViewLayer에서 필요한 메소드 만들기
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
//    var name: String?
//    var bounty: Int?
    //데이터에 필요한 프로퍼티 추가
    
    let viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
            //필요한 데이터 등록
        }
        
//        if let bountyInfo = self.bountyInfo {
//            imgView.image = bountyInfo.image
//            nameLabel.text = bountyInfo.name
//            bountyLabel.text = "\(bountyInfo.bounty)"
//            //필요한 데이터 등록
//        }
        
//        if let name = self.name, let bounty = self.bounty {
//
//        let img = UIImage(named: "\(name).jpg")
//        //원하는 파일 형식의 이미지를 갖고와서 변수에 저장
//
//        imgView.image = img
//        nameLabel.text = name
//        bountyLabel.text = "\(bounty)"
//        //필요한 데이터 등록
//        }
    }
    

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        //close 버튼을 누르면 해당 레이아웃 꺼짐
    }
    
}

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?){
        bountyInfo = model
    }
}
