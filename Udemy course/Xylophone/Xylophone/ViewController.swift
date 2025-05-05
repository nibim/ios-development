//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    var duration: TimeInterval = 0.3
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func KeyPressed(_ sender: UIButton) {
        print(sender.alpha)
        changeOpacity(for: sender, duration: 0.5)
        playSound(soundName: sender.currentTitle!)
    }
    func changeOpacity(for button: UIButton, duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            button.alpha = 0.5  // Fade to 50%
        }) { _ in
            UIView.animate(withDuration: duration) {
                button.alpha = 1.0  // Fade back to normal after animation completes
            }
        }
    }

    
    func playSound(soundName : String) {
        guard let path = Bundle.main.url(forResource: soundName, withExtension: "wav") else {
            return }
        let url = URL(fileURLWithPath: path.path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

