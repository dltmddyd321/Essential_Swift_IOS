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
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
    let viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
        
    }
    
    private func prepareAnimation() {
//        nameLabelCenterX.constant = view.bounds.width
//        bountyLabelCenterX.constant = view.bounds.width
        
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
    }
    
    private func showAnimation() {
//        nameLabelCenterX.constant = 0
//        bountyLabelCenterX.constant = 0
//
//        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
//            self.view.layoutIfNeeded()
//        }, completion: nil)
//        //텍스트에 대한 애니메이션 효과
//
//        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
//        //이미지에 대한 애니메이션 효과
//
//        UIView.animate(withDuration: 0.3) {
//            self.view.layoutIfNeeded()
//        } //0.3초 동안 애니메이션 효과 적용
        
        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: {
            self.nameLabel.transform = CGAffineTransform.identity
            self.bountyLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1
            self.bountyLabel.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        } //0.3초 동안 애니메이션 효과 적용
    }
    
    func updateUI() {
        
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
            //필요한 데이터 등록
        }
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
