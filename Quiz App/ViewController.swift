//
//  ViewController.swift
//  Quiz App
//
//  Created by itss on 26/11/19.
//  Copyright © 2019 itss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentQuestion = 1
    var score = 0
    var quizStarted = false
    var myTimer : Timer!
    var secondSinceStart = 0
    var minutesSinceStart = 0
    
    @IBOutlet weak var firstStrike: UIImageView!
    @IBOutlet weak var secondStrike: UIImageView!
    @IBOutlet weak var thirdStrike: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var continueLabel: UILabel!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var questionPageControl: UIPageControl!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    var questionsSet = [Question(questionStatement: "Which planet does humans live on?", optionA: "Mars", optionB: "Earth", optionC: "Venus", optionD: "Jupiter", correctOption: OptionChoice.two, answeredCorrectly: false), Question(questionStatement: "What is the largest planet in the solar system?", optionA: "Jupiter", optionB: "Saturn", optionC: "Earth", optionD: "Venus", correctOption: OptionChoice.one, answeredCorrectly: false), Question(questionStatement: "What is the planet closest to the sun?", optionA: "Venus", optionB: "Earth", optionC: "Mercury", optionD: "Mars", correctOption: OptionChoice.three, answeredCorrectly: false), Question(questionStatement: "Which of the following planet has rings?", optionA: "Jupiter", optionB: "Neptune", optionC: "Venus", optionD: "Saturn", correctOption: OptionChoice.four, answeredCorrectly: false), Question(questionStatement: "Which planet is the furthest to the sun?", optionA: "Uranus", optionB: "Saturn", optionC: "Neptune", optionD: "Pluto", correctOption: OptionChoice.three, answeredCorrectly: false), Question(questionStatement: "What is Mars known for?", optionA: "The hot planet", optionB: "The blue planet", optionC: "The red planet", optionD: "The pink planet", correctOption: OptionChoice.three, answeredCorrectly: false), Question(questionStatement: "When did Neil Armstong set foot on the moon?", optionA: "1968", optionB: "1969", optionC: "1970", optionD: "1967", correctOption: OptionChoice.two, answeredCorrectly: false), Question(questionStatement: "What is the smallest planet in the solar system?", optionA: "Mercury", optionB: "Neptune", optionC: "Pluto", optionD: "Uranus", correctOption: OptionChoice.one, answeredCorrectly: false), Question(questionStatement: "Which planet has the most moons?", optionA: "Neptune", optionB: "Uranus", optionC: "Mercury", optionD: "Saturn", correctOption: OptionChoice.four, answeredCorrectly: false), Question(questionStatement: "Which is not part of the solar system?", optionA: "Mars", optionB: "Earth", optionC: "Pluto", optionD: "Neptune", correctOption: OptionChoice.three, answeredCorrectly: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestions()
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        quizStarted = true
        tapGesture.isEnabled = false
        continueLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    func setupQuestions() {
        questionLabel.text = questionsSet[currentQuestion].questionStatement
        aButton.setTitle(questionsSet[currentQuestion].optionA, for: .normal)
        bButton.setTitle(questionsSet[currentQuestion].optionB, for: .normal)
        cButton.setTitle(questionsSet[currentQuestion].optionC, for: .normal)
        dButton.setTitle(questionsSet[currentQuestion].optionD, for: .normal)
        tapGesture.isEnabled = false
        continueLabel.isHidden = true
        aButton.isEnabled = true
        bButton.isEnabled = true
        cButton.isEnabled = true
        dButton.isEnabled = true
    }
    
      @objc func updateTimer() {
          if quizStarted == true {
              secondSinceStart += 1
          }
          else {
              secondSinceStart += 0
          }
        
        if secondSinceStart < 60 {
            print(secondSinceStart)
        }
        else {
            minutesSinceStart += 1
            secondSinceStart = 0
        }
        
        timerLabel.text = "⏰ \(minutesSinceStart):\(secondSinceStart)"
        
      }
    
     func disableButtionsAndContinue () {
           aButton.isEnabled = false
           bButton.isEnabled = false
           cButton.isEnabled = false
           dButton.isEnabled = false
           tapGesture.isEnabled = true
           continueLabel.isHidden = false
    }
    
    @IBAction func option1Clicked(_ sender: Any) {
        if questionsSet[currentQuestion].correctOption == .one {
            aButton.setTitle("\(questionsSet[currentQuestion].optionA) ☑️", for: .normal)
            score += 1
            questionsSet[currentQuestion].answeredCorrectly = true
        }
        else {
            aButton.setTitle("\(questionsSet[currentQuestion].optionA) ❌", for: .normal)
        }
        disableButtionsAndContinue()
        resultsLabel.text = "Progress: \(currentQuestion)/10"
    }
    
    @IBAction func option2Clicked(_ sender: Any) {
        if questionsSet[currentQuestion].correctOption == .two {
            bButton.setTitle("\(questionsSet[currentQuestion].optionB) ☑️", for: .normal)
            score += 1
            questionsSet[currentQuestion].answeredCorrectly = true
        }
        else {
            bButton.setTitle("\(questionsSet[currentQuestion].optionB) ❌", for: .normal)
        }
        disableButtionsAndContinue()
        resultsLabel.text = "Progress: \(currentQuestion)/10"
    }
    
    @IBAction func option3Clicked(_ sender: Any) {
        if questionsSet[currentQuestion].correctOption == .three {
            cButton.setTitle("\(questionsSet[currentQuestion].optionC) ☑️", for: .normal)
            score += 1
            questionsSet[currentQuestion].answeredCorrectly = true
        }
        else {
            cButton.setTitle("\(questionsSet[currentQuestion].optionC) ❌", for: .normal)
        }
        disableButtionsAndContinue()
        resultsLabel.text = "Progress: \(currentQuestion)/10"
    }
    
    
    @IBAction func option4Clicked(_ sender: Any) {
        if questionsSet[currentQuestion].correctOption == .three {
                dButton.setTitle("\(questionsSet[currentQuestion].optionD) ☑️", for: .normal)
                score += 1
                questionsSet[currentQuestion].answeredCorrectly = true
            }
            else {
                dButton.setTitle("\(questionsSet[currentQuestion].optionD) ❌", for: .normal)
            }
        disableButtionsAndContinue()
        resultsLabel.text = "Progress: \(currentQuestion)/10"
    }
    
    @IBAction func tapToContinueTapped(_ sender: Any) {
        print("Tapped")
        if currentQuestion < questionsSet.count-1 {
            currentQuestion += 1
            setupQuestions()
        }
        else {
            aButton.isEnabled = false
            bButton.isEnabled = false
            cButton.isEnabled = false
            dButton.isEnabled = false
            quizStarted = false
            questionLabel.text = "Score: \(score) ⏰ Time: \(minutesSinceStart):\(secondSinceStart)"
        }
    }
    
}

