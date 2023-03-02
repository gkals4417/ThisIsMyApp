//
//  WelldoneViewController.swift
//  EggTimer_Pulsar
//
//  Created by Hamin Jeong on 2023/02/23.
//

import UIKit

class WelldoneViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    var timer: Timer?
    var totalTime: Int = 1
    var passedTime: Int = 721
    var isPaused: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("WelldoneVC is Loaded")
        mainLabel.text = "완숙"
        appearence()
    }
    
    func appearence() {
        startButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        startButton.setTitle("", for: .normal)
        startButton.tintColor = .black
        mainLabel.font = UIFont(name: "systemfont", size: 30)
        mainLabel.textColor = .magenta
    }
   
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if passedTime == 721 {
            startTimer ()
        } else {
            pauseTimer()
        }
    }
    
    
    
    @objc func updateTimer(){
        if passedTime > totalTime {
            passedTime -= 1
            mainLabel.text = "\(passedTime)초"

        } else {
            timer?.invalidate()
            passedTime = 721
            mainLabel.text = "완료되었습니다."
            startButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }

    func startTimer(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        startButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        print(passedTime)
    }

    func pauseTimer(){
        if isPaused {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            isPaused = false
            startButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        } else {
            timer?.invalidate()
            isPaused = true
            startButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        }
    }

    

}
