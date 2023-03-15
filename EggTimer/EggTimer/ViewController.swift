//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer!

class ViewController: UIViewController {
    let eggTimes = ["Soft": 3,"Medium": 5,"Hard": 7]
//    开始时间
    var totalTime = 0
    var secondPassed = 0
//    计时器
    var timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {

//        获取到文字
        let hardness = sender.currentTitle!
//        取到对应具体值
        totalTime = eggTimes[hardness]!
        //        取消倒计时
        timer.invalidate()
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
//        倒计时每秒
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondPassed <= totalTime {
            
            progressBar.progress = Float(secondPassed) / Float(totalTime)
            
            secondPassed += 1
           
        } else {
            timer.invalidate()
            titleLabel.text =  "完成"
            playSound()
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
 
}
