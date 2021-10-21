//
//  ViewController.swift
//  Diary
//
//  Created by 이승용 on 2021/10/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    private var diaryList = [Diary]() {
        didSet {
            self.saveDiaryList()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        self.loadDiaryList()
    }
    
    private func configureCollectionView() {
        self.collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        self.collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let writeDiaryViewController = segue.destination as? WriteViewController {
            writeDiaryViewController.delegate = self
        }
    }
    
    private func saveDiaryList() {
        let date = self.diaryList.map {
            [
                "title" : $0.title,
                "contents": $0.contents,
                "date" : $0.date,
                "isStar" : $0.isStar
            ]
        }
        //데이터 저장 형식 선언 후, UserDefaults 접근
        let userDefaults = UserDefaults.standard
        userDefaults.set(date, forKey: "diaryList")
    }
    
    private func loadDiaryList() {
        //저장할 값이 있는 배열을 호출하고 다운 캐스팅
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "diaryList") as? [[String:Any]] else {return}
        self.diaryList = data.compactMap {
            guard let title = $0["title"] as? String else { return nil}
            guard let contents = $0["contents"] as? String else { return nil}
            guard let isStar = $0["isStar"] as? Bool else { return nil }
            guard let date = $0["date"] as? Date else { return nil }
            return Diary(title: title, contents: contents, date: date, isStar: isStar)
        }
        self.diaryList = self.diaryList.sorted(by: {
            //왼쪽의 날짜값을 오른쪽의 날짜값과 비교하여 내림차순 정렬
            $0.date.compare($1.date) == .orderedDescending
        })
    }
    
    private func dateToString(date : Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    //존재하는 데이터만큼 셀을 생성하기 위해 개수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.diaryList.count
    }
    
    //셀을 생성하기 위한 재사용 가능 셀 호출
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiaryCell", for: indexPath) as? DiaryCell else {return UICollectionViewCell() }
        let diary = self.diaryList[indexPath.row]
        cell.titleLabel.text = diary.title
        cell.dateLabel.text = self.dateToString(date: diary.date)
        return cell
    }
}

//표시할 셀의 사이즈 지정
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width/2) - 20, height: 200)
    }
}

extension ViewController: WriteDiaryViewDelegate {
    func didSelectRegister(diary: Diary) {
        //반환받은 값을 배열에 추가
        self.diaryList.append(diary)
        self.diaryList = self.diaryList.sorted(by: {
            //왼쪽의 날짜값을 오른쪽의 날짜값과 비교하여 내림차순 정렬
            $0.date.compare($1.date) == .orderedDescending
        })
        self.collectionView.reloadData()
    }
}
