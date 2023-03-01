//
//  RareViewController.swift
//  EggTimer_Pulsar
//
//  Created by Hamin Jeong on 2023/02/23.
//

import UIKit	

class RareViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    var timer: Timer?
    var totalTime: Int = 390
    var passedTime: Int = 0
    var isPaused: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RareVC is Loaded")
        mainLabel.text = "RareVC is Loaded"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        startTimer()
    }
    
    
    
    @objc func updateTimer(){
        if passedTime < totalTime {
            passedTime += 1
            mainLabel.text = "\(passedTime)초"
        } else {
            timer?.invalidate()
            passedTime = 0
        }
    }

    func startTimer(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        print(passedTime)
    }

    func pauseTimer(){
        if isPaused {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            isPaused = false
        } else {
            timer?.invalidate()
            isPaused = true
        }
    }
    
    
}
