//
//  RareViewController.swift
//  EggTimer_Pulsar
//
//  Created by Hamin Jeong on 2023/02/23.
//

import UIKit	
import AVFoundation

final class RareViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!

    //원래는 390초
    private var timer: Timer?
    private var totalTime: Int = 1
    private var passedTime: Int = 6
    private var isPaused: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearence()
        print("RareVC is Loaded")
        mainLabel.text = "완전반숙"
    }
    
    private func appearence() {
        startButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        startButton.setTitle("", for: .normal)
        startButton.tintColor = .black
        mainLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 30)
        mainLabel.textColor = .red
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if passedTime == 6 {
            startTimer ()
        } else {
            pauseTimer()
        }
    }
    
    
    @objc private func updateTimer(){
        if passedTime > totalTime {
            passedTime -= 1
            mainLabel.text = "\(passedTime)초"
        } else {
            timer?.invalidate()
            mainLabel.text = "완료되었습니다."
            startButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            AudioServicesPlayAlertSound(SystemSoundID(1304))
            passedTime = 6
        }
    }

    private func startTimer(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
        startButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        print(passedTime)
    }

    private func pauseTimer(){
        if isPaused {
            timer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(updateTimer),
                userInfo: nil,
                repeats: true
            )
            isPaused = false
            startButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        } else {
            timer?.invalidate()
            isPaused = true
            startButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }
    
    
}
