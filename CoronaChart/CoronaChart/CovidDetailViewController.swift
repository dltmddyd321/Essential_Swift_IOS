//
//  CovidDetailViewController.swift
//  CoronaChart
//
//  Created by 이승용 on 2022/10/04.
//

import UIKit

class CovidDetailViewController: UITableViewController {
    @IBOutlet weak var newCaseCell: UITableViewCell!
    @IBOutlet weak var totalCaseCell: UITableViewCell!
    @IBOutlet weak var recoveredCell: UITableViewCell!
    @IBOutlet weak var deathCell: UITableViewCell!
    @IBOutlet weak var overseasInflowCell: UITableViewCell!
    @IBOutlet weak var percentageCell: UITableViewCell!
    @IBOutlet weak var regionalOutBreakCell: UITableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
