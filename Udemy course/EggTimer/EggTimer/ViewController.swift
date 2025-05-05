//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var cookedLevel: UIProgressView!
    let eggTimes: [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 720]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        cookedLevel.isHidden = true  // Set initial progress to 0
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        cookedLevel.isHidden = false
        cookedLevel.progress = 0.0
        secondsPassed = 0
        timer.invalidate()
        let hardness = sender.currentTitle!
        titleLable.text = hardness
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime    {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            cookedLevel.progress = percentageProgress
        }
        else {
            timer.invalidate()
            titleLable.text = "Done!"
            playAudio()
        }
    }
    func playAudio() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}
