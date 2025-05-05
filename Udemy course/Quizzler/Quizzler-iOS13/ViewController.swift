//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var continueButton: UIButton! // New button for "Continue"

    var quizBrain = ْQuizBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func answerButtonClicked(_ sender: UIButton) {
        trueButton.setTitle("True", for: .normal)
        falseButton.isHidden = false
        var answerBoolean: Bool = quizBrain.checkAnswer(userAnswer: sender.currentTitle!)
        if(answerBoolean){
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    @objc func updateUI() {
        questionLable.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
}

