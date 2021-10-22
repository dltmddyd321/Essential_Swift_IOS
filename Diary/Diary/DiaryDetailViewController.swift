//
//  DiaryDetailViewController.swift
//  Diary
//
//  Created by 이승용 on 2021/10/19.
//

import UIKit

protocol DiaryDetailViewDelegate : AnyObject {
    func didSelectDelete(indexPath: IndexPath)
}

class DiaryDetailViewController: UIViewController {

    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    weak var delegate: DiaryDetailViewDelegate?
    
    var diary: Diary?
    var indextPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        
    }
    
    private func configureView() {
        guard let diary = self.diary else { return }
        self.titleLabel.text = diary.title
        self.contentsTextView.text = diary.contents
        self.dateLabel.text = self.dateToString(date: diary.date)
    }
    
    private func dateToString(date : Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    @IBAction func editBtn(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "WriteDiaryViewController") as? WriteViewController else { return }
        
        //넘겨줄 값들을 지정하고 EditorMode에 반영
        guard let indexPath = self.indextPath else {return}
        guard let diary = self.diary else {return}
        viewController.diaryEditorMode = .edit(indexPath, diary)
        
        //값을 넘기는 쪽에서 옵저버를 추가
        NotificationCenter.default.addObserver(self, selector: #selector(editDiaryNotification(_:)), name: NSNotification.Name("editDiary"), object: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    //수정된 일기장 내용을 업데이트할 옵저버
    @objc func editDiaryNotification(_ notification : Notification) {
        //다이어리에 등록된 object 다운 캐스팅
        guard let diary = notification.object as? Diary else {return}
        guard let row = notification.userInfo?["indexPath.row"] as? Int else {return}
        self.diary = diary
        self.configureView()
    }
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        guard let indexPath = self.indextPath else {return}
        self.delegate?.didSelectDelete(indexPath: indexPath)
        self.navigationController?.popViewController(animated: true)
    }
    
    //인스턴스가 해제되는 시점에 자동적으로 옵저버 소멸
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
