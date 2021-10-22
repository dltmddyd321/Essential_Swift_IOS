//
//  WriteViewController.swift
//  Diary
//
//  Created by 이승용 on 2021/10/19.
//

import UIKit

enum DiaryEditorMode {
    case new
    case edit(IndexPath, Diary)
}

protocol WriteDiaryViewDelegate : AnyObject{
    func didSelectRegister(diary: Diary)
}

class WriteViewController: UIViewController {

    @IBOutlet weak var confirmBtn: UIBarButtonItem!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.configureDatePicker()
        self.configureEditorMode()
        self.confirmBtn.isEnabled = false
        self.configureInputField()
    }
    
    //날짜 선택 기능을 위한 프로퍼티
    private let datePicker = UIDatePicker()
    private var diaryDate: Date?
    weak var delegate: WriteDiaryViewDelegate?
    
    //수정할 일기장 객체를 전달할 매개체
    var diaryEditorMode: DiaryEditorMode = .new
    
    //수정 상황 시 데이터 반영
    private func configureEditorMode() {
        switch self.diaryEditorMode {
        case let .edit(_, diary) :
            self.titleTextField.text = diary.title
            self.contentsTextView.text = diary.contents
            self.dateTextField.text = self.dateToString(date: diary.date)
            self.diaryDate = diary.date
            self.confirmBtn.title = "수정"
            
        default:
            break
        }
    }
    
    private func dateToString(date : Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    private func configureDatePicker() {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        
        //데이터 값이 변경될때마다 새로운 날짜를 등록하는 알고리즘 호출
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        self.datePicker.locale = Locale(identifier: "ko-KR")
        self.dateTextField.inputView = self.datePicker
    }
    
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        //날짜 데이터를 문자열로 변경 또는 반대의 프로세스를 지원
        let formmater = DateFormatter()
        
        //데이터 형식 지정
        formmater.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
        
        //지역 데이터 지정
        formmater.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formmater.string(from: datePicker.date)
        
        //내용이 수정될때마다 인식
        self.dateTextField.sendActions(for: .editingChanged)
    }
    
    //View의 테두리 생성 함수
    private func configureContentsTextView() {
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        self.contentsTextView.layer.borderColor = borderColor.cgColor
        self.contentsTextView.layer.borderWidth = 0.5
        self.contentsTextView.layer.cornerRadius = 5.0
    }
    
    private func configureInputField() {
        self.contentsTextView.delegate = self
        self.dateTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(dateTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc private func titleTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }
    
    @objc private func dateTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }
    
    @IBAction func tapConfirmBtn(_ sender: UIBarButtonItem) {
        //전달할 값들을 옵셔널 바인딩
        guard let title = self.titleTextField.text else { return }
        guard let contents = self.contentsTextView.text else { return }
        guard let date = self.diaryDate else { return }
        
        //다이어리 객체 delegate를 통해 값을 반환하고 페이지 이동
        let diary = Diary(title: title, contents: contents, date: date, isStar: false)
        
        switch self.diaryEditorMode {
        case .new:
            self.delegate?.didSelectRegister(diary: diary)

        case let .edit(IndexPath, _) :
            //수정 이벤트를 인식하고 데이터를 반영하기 위해 NotificationCenter 사용
            //Name : 알림을 식별하는 태그
            //object : 발송자가 옵저버에게 보내려는 객체로서, 당연히 diary
            //일기장에 관련된 값이나 주소이므로 IndexPath.row를 Dictionary 형태로 등록
            NotificationCenter.default.post(name: NSNotification.Name("editDiary"), object: diary, userInfo: [
                "indexPath.row" : IndexPath.row
            ])
        }
        
        self.delegate?.didSelectRegister(diary: diary)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //빈 화면 클릭 시 키보드 또는 DatePiceker 사라지도록 하기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //입력 내용이 빈 칸이 아니라 유효한지 확인
    private func validateInputField() {
        self.confirmBtn.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) && !self.contentsTextView.text.isEmpty
    }
}

extension WriteViewController: UITextViewDelegate {
    //텍스트 내용이 입력될 때마다 호출
    func textViewDidChange(_ textView: UITextView) {
        self.validateInputField()
    }
}
