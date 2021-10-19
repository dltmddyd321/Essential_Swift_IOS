//
//  ViewController.swift
//  TodoList
//
//  Created by 이승용 on 2021/10/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var editBtn: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var doneBtn: UIBarButtonItem?
    
    var tasks = [Task]() {
        didSet {
            self.saveTasks()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtnTap))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks()
    }
    
    @objc func doneBtnTap() {
        self.navigationItem.leftBarButtonItem = self.editBtn
        self.tableView.setEditing(false, animated: true)
    }

    @IBAction func editBtn(_ sender: UIBarButtonItem) {
        //tasks가 비어있지 않을 때만 활성화
        guard !self.tasks.isEmpty else { return }
        
        //Bar Button 클릭 시 편집 모드 활성화
        self.navigationItem.leftBarButtonItem = self.doneBtn
        self.tableView.setEditing(true, animated: true)
    }
    
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert)
        
        //메모리 누수 방지를 위한 캡처 목록 정의
        let registerBtn = UIAlertAction(title: "등록", style: .default, handler: {[weak self] _ in
            //옵셔널 바인딩 이후 입력된 값을 Task 배열에 추가
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            
            //데이터 갱신
            self?.tableView.reloadData()
        })
        
        let cancelBtn = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(cancelBtn)
        alert.addAction(registerBtn)
        alert.addTextField(configurationHandler:  {
            textField in textField.placeholder = "할 일 입력을 입력하시오."
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveTasks() {
        
        //저장할 데이터 형식을 Dictionary 형태로 선언
        let data = self.tasks.map {
            [
                "title" : $0.title,
                "done" : $0.done
            ]
        }
        
        //데이터를 저장
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    func loadTasks() {
        //저장한 데이터를 호출
        let userDefaults = UserDefaults.standard
        
        //데이터를 Dictionary 형태로 선언했으니 타입 캐스팅
        guard let data =  userDefaults.object(forKey: "tasks") as? [[String:Any]] else {return}
        
        self.tasks = data.compactMap {
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else {return nil}
            return Task(title: title, done: done)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    //특정 Row를 그리기 위해 셀을 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //스토리보드에서 정의한 셀을 코드적으로 가져오기
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        if task.done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //지정한 셀을 삭제 버튼을 통해 삭제
        self.tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        if self.tasks.isEmpty {
            self.doneBtnTap()
        }
    }
    
    //셀의 위치를 임의대로 조정 가능한 메서드 1
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //셀의 위치를 임의대로 조정 가능한 메서드 2
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
