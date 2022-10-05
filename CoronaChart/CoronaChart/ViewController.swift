//
//  ViewController.swift
//  CoronaChart
//
//  Created by 이승용 on 2022/10/04.
//

import UIKit
import Alamofire
import Charts

class ViewController: UIViewController {
    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet weak var newCaseLabel: UILabel!
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCovidOverview(completionHandler: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(result) :
                debugPrint("success \(result)")
            
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
    //Escaping 클로저는 클로저가 함수의 인자로 전달됐을 때, 함수의 실행이 종료된 후 실행되는 클로저
    //Non-Escaping 클로저는 이와 반대로 함수의 실행이 종료되기 전에 실행되는 클로저
    func fetchCovidOverview(
        completionHandler: @escaping (Swift.Result<CityCovidOverview, Error>) -> Void
    ) {
        let url = "https://api.corona-19.kr/korea/country/new/"
        let param = [
            "serviceKey": "qiBhWTeQNl5ncVDvRfKXbPCMx19zFkZHY"
        ]
        
        Alamofire.request(url, method: .get, parameters: param)
            .responseData(completionHandler: { response in
                switch response.result {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(CityCovidOverview.self, from: data)
                        completionHandler(.success(result))
                    } catch {
                        completionHandler(.failure(error))
                    }
                    
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            })
    }

}

