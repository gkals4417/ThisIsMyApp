//
//  TimerManager.swift
//  EggTimer_Pulsar
//
//  Created by Hamin Jeong on 2023/03/01.
//

import UIKit


class TimerManager {
    
    private var timer: Timer?
    var totalTime: Int
    var passedTime: Int
    var isPaused: Bool
    
    
    init(totalTime: Int, passedTime: Int, isPaused: Bool) {
        self.totalTime = totalTime
        self.passedTime = passedTime
        self.isPaused = isPaused
    }

    @objc func updateTimer(){
        if passedTime < totalTime {
            passedTime += 1
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
