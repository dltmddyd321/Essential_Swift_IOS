//
//  BountyViewController.swift
//  BountyList
//
//  Created by 이승용 on 2021/07/19.
//

import UIKit

class BountyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    //MVVM
    
    //Model
    //- BountyInfo
    
    //View
    //- ListCell
    //- ListCell에 필요한 정보를 ViewModel에게서 받아오기
    //- ListCell은 ViewModel로부터 받은 정보로 View Update
    
    //ViewModel
    //- BountyViewModel
    //- BountyViewModel를 만들고, View Layer에서 필요한 메소드 만들기

    
    let viewModel = BountyViewModel()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //DetailViewController에게 데이터를 전송
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            //세그웨이의 목적지 컨트롤러 지정
            
            if let index = sender as? Int {
                // let bountyInfo = bountyInfoList[index]
                let bountyInfo = viewModel.bountyInfo(at: index)
                
                vc?.viewModel.update(model: bountyInfo)
                
            } //name과 bounty를 세그웨이가 수행되면서 미리 업데이트
        }
        
    }
    //세그웨이가 수행되기 전 특정 준비를 하는 메소드
    //세그웨이를 통해 데이터를 넘겨주고 싶다면 prepare로 준비

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // UICollectionViewDataSource
    //몇 개의 아이템을 보여줄 것인가?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    
    //셀은 어떤 방식으로 표현할 것인가?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        
        let bountyInfo = viewModel.bountyInfo(at: indexPath.item)
        
        cell.update(info: bountyInfo)
        return cell
    }
    
    // UICollectionViewDelegate
    //셀이 클릭되었을때 어떻게 진행할 것인가?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("--> \(indexPath.item)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    //UICollectionViewDelegateFlowLayout
    //셀 사이즈 계산 -> 각종 디바이스에서 일관적인 형태를 보여주기 위함.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 65
        
        let width: CGFloat = (collectionView.bounds.width - itemSpacing)/2
        //bounds로 collectionView의 크기를 알 수 있음.
        let height: CGFloat = width * 10/7 + textAreaHeight
        return CGSize(width: width, height: height)
    }
    
    
//    //UITableViewDataSource
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return bountyList.count
//        return viewModel.numOfBountyInfoList
//    } //몇 개의 셀이 활성화 될 것인지 지정 -> 리스트 요소 개수 만큼 활성
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
//            return UITableViewCell()
//        }
//        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
//        cell.update(info: bountyInfo)
//        return cell
//    } //등록하여 반환할 셀의 id 지정
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("--> \(indexPath.row)")
//        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
//    } //세그웨이 지정
//    //sender에 index.row를 지정함으로서 몇 번째 셀인지를 전송
}

class ListCell: UITableViewCell { //커스텀 뷰 생성
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}





//코드 구조화에 대한 전력 -> 기술 부채 최소화 / 재사용 및 지속 가능
//1. 클린 아키텍처
//2. MVVM 디자인 패턴 (Model - View - ViewModel)
// - ViewModel은 중계자 역할로서, View와 ViewController와 소통
// - ViewModel은 Model을 갖고있으며, Model은 혼자 View, ViewController와 소통 불가
// - MVVM 이전에 MVC 사용 (Model - View - Controller)
// 리팩터링 : 기술 부채를 최소화하고 유지 보수성을 높이기 위해 코드를 점검하고 수정하는 것



class BountyViewModel {
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 30000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 70000000),
        BountyInfo(name: "zoro", bounty: 27000000)
    ]
    
    var sortedList: [BountyInfo] {
        let sortedList = bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        return sortedList
    } //가격이 비싼 순서대로 상위부터 배치
    
    var numOfBountyInfoList : Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo {
        return sortedList[index]
    }
}

class GridCell: UICollectionViewCell { //커스텀 뷰 생성
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}
