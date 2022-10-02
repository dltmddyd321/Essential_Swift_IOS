//
//  ViewController.swift
//  pomodoroBasic
//
//  Created by 이승용 on 2022/10/01.
//

import UIKit
import AudioToolbox

enum TimerStatus {
    case start
    case pause
    case end
}

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    //타이머에 저장된 시간을 초 단위로 저장하는 프로퍼티
    var duration = 60
    var timerStatus: TimerStatus = .end
    var timer: DispatchSourceTimer?
    var currentSeconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configStartBtn()
    }
    
    func setTimerInfoViewVisible(isHidden: Bool) {
        self.timerLabel.isHidden = isHidden
        self.progressView.isHidden = isHidden
    }
    
    func configStartBtn() {
        self.startBtn.setTitle("시작", for: .normal)
        self.startBtn.setTitle("일시정지", for: .selected)
    }
    
    func startTimer() {
        if self.timer == nil {
            //UI 갱신을 위해 메인 스레드 큐에서 처리되도록 한다.
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            //타이머가 시작되면 바로 발동 및 1초마다 스케쥴링
            self.timer?.schedule(deadline: .now(), repeating: 1)
            //1초에 한번씩 핸들러 클로저 내부 로직 발동
            self.timer?.setEventHandler(handler: {
                //클로저 내부에서 지연 할당의 가능성이 있는 경우 weak self 선언
                [weak self] in
                
                //non null 처리로 Strong
                guard let self = self else {return}
                
                self.currentSeconds -= 1
                let hour = self.currentSeconds / 3600
                let minutes = (self.currentSeconds % 3600) / 60
                let seconds = (self.currentSeconds % 3600) % 60
                
                self.timerLabel.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds)
                self.progressView.progress = Float(self.currentSeconds) / Float(self.duration)
                
                UIView.animate(withDuration: 0.5, delay: 0 ,animations: {
                    self.imgView.transform = CGAffineTransform(rotationAngle: .pi)
                })
                UIView.animate(withDuration: 0.5, delay: 0.5,animations: {
                    self.imgView.transform = CGAffineTransform(rotationAngle: .pi * 2)
                })
                
                if self.currentSeconds <= 0 {
                    self.stopTimer()
                    AudioServicesPlaySystemSound(1005)
                }
                
            })
            self.timer?.resume()
        }
    }
    
    func stopTimer() {
        if (self.timerStatus == .pause) {
            self.timer?.resume()
        }
        self.timerStatus = .end
        self.cancelBtn.isEnabled = false
        UIView.animate(withDuration: 0.5, animations: {
            self.timerLabel.alpha = 0
            self.progressView.alpha = 0
            self.datePicker.alpha = 1
            //imgView 원상복귀
            self.imgView.transform = .identity
        })
        self.startBtn.isSelected = false
        self.timer?.cancel()
        //반드시 resume 이후 메모리 해제 처리
        self.timer = nil
    }

    @IBAction func tapCancelBtn(_ sender: UIButton) {
        switch self.timerStatus {
        case .start, .pause:
            self.stopTimer()
            
        default:
            break
        }
    }
    
    @IBAction func tabStartBtn(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration)
        
        switch self.timerStatus {
        case .end:
            self.currentSeconds = self.duration
            self.timerStatus = .start
            UIView.animate(withDuration: 0.5, animations: {
                self.timerLabel.alpha = 1
                self.progressView.alpha = 1
                self.datePicker.alpha = 0
            })
            self.startBtn.isSelected = true
            self.cancelBtn.isEnabled = true
            self.startTimer()
            
        case .start:
            self.timerStatus = .pause
            self.startBtn.isSelected = false
            self.timer?.suspend()
            
        case .pause:
            self.timerStatus = .start
            self.startBtn.isSelected = true
            self.timer?.resume()
        }
    }
}

