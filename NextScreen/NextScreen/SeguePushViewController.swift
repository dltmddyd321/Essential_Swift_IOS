
import UIKit

class SeguePushViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var name : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        }
    }
    @IBAction func tabBackBtn(_ sender: UIButton) {
        //이전화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)
        
        //제일 최상위 루트화면으로 돌아가기
        //self.navigationController?.popToRootViewController(animated: true)
    }
}
