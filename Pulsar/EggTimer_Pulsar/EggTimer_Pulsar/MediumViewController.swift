//
//  MediumViewController.swift
//  EggTimer_Pulsar
//
//  Created by Hamin Jeong on 2023/02/23.
//

import UIKit
import AVFoundation

final class MediumViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    private var timer: Timer?
    private var totalTime: Int = 1
    private var passedTime: Int = 511
    private var isPaused: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MediumVC is Loaded")
        mainLabel.text = "반숙"
        appearence()
    }
    
    private func appearence() {
        startButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        startButton.setTitle("", for: .normal)
        startButton.tintColor = .black
        mainLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 30)
        mainLabel.textColor = .blue
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if passedTime == 511 {
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
            passedTime = 511
            mainLabel.text = "완료되었습니다."
            startButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            AudioServicesPlayAlertSound(SystemSoundID(1304))
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
