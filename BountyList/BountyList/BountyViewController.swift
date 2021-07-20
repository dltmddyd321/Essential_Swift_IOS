//
//  BountyViewController.swift
//  BountyList
//
//  Created by 이승용 on 2021/07/19.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
    
//    let bountyInfoList: [BountyInfo] = [
//        BountyInfo(name: "brook", bounty: 33000000),
//        BountyInfo(name: "chopper", bounty: 50),
//        BountyInfo(name: "franky", bounty: 44000000),
//        BountyInfo(name: "luffy", bounty: 30000000),
//        BountyInfo(name: "nami", bounty: 16000000),
//        BountyInfo(name: "robin", bounty: 80000000),
//        BountyInfo(name: "sanji", bounty: 70000000),
//        BountyInfo(name: "zoro", bounty: 12000000)
//    ]
    
    let viewModel = BountyViewModel()
    
//    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
//
//    let bountyList = [33000000, 50, 44000000, 30000000, 16000000, 80000000, 70000000, 12000000]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //DetailViewController에게 데이터를 전송
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            //세그웨이의 목적지 컨트롤러 지정
            
            if let index = sender as? Int {
                // let bountyInfo = bountyInfoList[index]
                let bountyInfo = viewModel.bountyInfo(at: index)
//                vc?.name = nameList[index]
//                vc?.bounty = bountyList[index]
                
                vc?.viewModel.update(model: bountyInfo)
//                vc?.name = bountyInfo.name
//                vc?.bounty = bountyInfo.bounty
                
            } //name과 bounty를 세그웨이가 수행되면서 미리 업데이트
        }
        
    }
    //세그웨이가 수행되기 전 특정 준비를 하는 메소드
    //세그웨이를 통해 데이터를 넘겨주고 싶다면 prepare로 준비

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return bountyList.count
        return viewModel.numOfBountyInfoList
    } //몇 개의 셀이 활성화 될 것인지 지정 -> 리스트 요소 개수 만큼 활성
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
//            return UITableViewCell()
//            //guard를 통해 nil일 경우 실행
//        }
//
//        return cell
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
//            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//            cell.imgView.image = img
//            cell.nameLabel.text = nameList[indexPath.row]
//            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
            
           // let bountyInfo = bountyInfoList[indexPath.row]
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        cell.imgView.image = bountyInfo.image
        cell.nameLabel.text = bountyInfo.name
        cell.bountyLabel.text = "\(bountyInfo.bounty)"
        return cell
    } //등록하여 반환할 셀의 id 지정
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    } //세그웨이 지정
    //sender에 index.row를 지정함으로서 몇 번째 셀인지를 전송
}

class ListCell: UITableViewCell { //커스텀 뷰 생성
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}


//코드 구조화에 대한 전력 -> 기술 부채 최소화 / 재사용 및 지속 가능
//1. 클린 아키텍처
//2. MVVM 디자인 패턴 (Model - View - ViewModel)
// - ViewModel은 중계자 역할로서, View와 ViewController와 소통
// - ViewModel은 Model을 갖고있으며, Model은 혼자 View, ViewController와 소통 불가
// - MVVM 이전에 MVC 사용 (Model - View - Controller)
// 리팩터링 : 기술 부채를 최소화하고 유지 보수성을 높이기 위해 코드를 점검하고 수정하는 것

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

class BountyViewModel {
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 30000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 70000000),
        BountyInfo(name: "zoro", bounty: 12000000)
    ]
    
    var numOfBountyInfoList : Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo {
        return bountyInfoList[index]
    }
}
