//
//  ViewController.swift
//  Weather
//
//  Created by 이승용 on 2022/10/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherDescLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tapFetcgWeather(_ sender: UIButton) {
        if let cityName = self.inputText.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true)
        }
    }
    
    func configView(weatherInfomation: WeatherInfomation) {
        self.cityNameLabel.text = weatherInfomation.name
        if let weather = weatherInfomation.weather.first {
            self.weatherDescLabel.text = weather.description
        }
        self.tempLabel.text = "\(Int(weatherInfomation.temp.temp - 273.15))"
        self.minTempLabel.text = "최저 : \(Int(weatherInfomation.temp.minTemp - 273.15))"
        self.maxTempLabel.text = "최고 : \(Int(weatherInfomation.temp.maxTemp - 273.15))"
    }
    
    func showErrAlert(msg: String) {
        let alert = UIAlertController(title: "Error!", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func getCurrentWeather(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=80b3b408e398e420f91d1e3fe08b5328") else {
            return
        }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { [weak self]
            data, response, err in
            
            let successRange = (200..<300)
            
            guard let data = data, err == nil else { return }
            let decoder = JSONDecoder()
            if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
                guard let weatherInformation = try? decoder.decode(WeatherInfomation.self, from: data) else { return }
                
                //Main Thread
                DispatchQueue.main.async {
                    self?.weatherStackView.isHidden = false
                    self?.configView(weatherInfomation: weatherInformation)
                }
            } else {
                guard let errorMessage = try? decoder.decode(ErrorMessage.self, from: data) else { return }
                DispatchQueue.main.async {
                    self?.showErrAlert(msg: errorMessage.message)
                }
            }
           
        }.resume()
    }
}

