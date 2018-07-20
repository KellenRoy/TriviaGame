//
//  questionAnswerController.swift
//  TriviaGame
//
//  Created by Arnav Gupta on 7/18/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class questionAnswerController: UIViewController
{
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
     var score = 0
    
    var info: String?
    var scoreDisplay: String?
    var answer: String?
    var answerDisplay2: String?
    var answerDisplay3: String?
    var answerDisplay4: String?
    var correctAnswer: String?
    var url: NSURL?
    var numberOfQuestionsAnswered = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        if let info = info
        {
            questionLabel.text = info
        }
        
        if let answer = answer
        {
            answerA.setTitle(answer, for: .normal)
        }
        
        if let answerDisplay2 = answerDisplay2
        {
            answerB.setTitle(answerDisplay2, for: .normal)
        }
        
        if let answerDisplay3 = answerDisplay3
        {
            answerC.setTitle(answerDisplay3, for: .normal)
        }
        
        if let answerDisplay4 = answerDisplay4
        {
            answerD.setTitle(answerDisplay4, for: .normal)
        }
        
        print(correctAnswer!)

    }
    
    func setUpViews() {
        answerA.layer.cornerRadius = 8
        answerA.layer.masksToBounds = true
        
        answerB.layer.cornerRadius = 8
        answerB.layer.masksToBounds = true
        
        answerC.layer.cornerRadius = 8
        answerC.layer.masksToBounds = true
        
        answerD.layer.cornerRadius = 8
        answerD.layer.masksToBounds = true
    }
    
    //Following button actions check for correct answer
    
    @IBAction func answerAPressed(_ sender: Any) {
      
        if (answerA.currentTitle == correctAnswer)  {
            score = score + 1
            scoreLabel.text = "Score: \(score)/10"
            nextQuestion()
            print(correctAnswer!)
            print(score)
        }
        else { nextQuestion()
              print(correctAnswer!)
            print(score)
        }
    
    }
    
    @IBAction func answerBPressed(_ sender: Any) {
        
        
        if (answerB.currentTitle == correctAnswer)  {
            score = score + 1
            scoreLabel.text = "Score: \(score)/10"
            nextQuestion()
              print(correctAnswer!)
            print(score)
        }
        else { nextQuestion()
            print(score)
            
        }
    }
    
    @IBAction func answerCPressed(_ sender: Any) {
        if (answerC.currentTitle == correctAnswer)  {
            score = score + 1
            scoreLabel.text = "Score: \(score)/10"
            nextQuestion()
              print(correctAnswer!)
            print(score)
        }
        else {
            nextQuestion()
            print(score)
        }
    }
    
    @IBAction func answerDPressed(_ sender: Any) {
       
        
        if (answerD.currentTitle == correctAnswer)  {
            score = score + 1
            scoreLabel.text = "Score: \(score)/10"
            nextQuestion()
              print(correctAnswer!)
            print(score)
        }
        else { nextQuestion()
            print(score)
        }
    }
    
    func nextQuestion() {
        
        let jsonData = try! Data(contentsOf: url as! URL)
        let userData = try! JSON(data: jsonData)
        let tempQuestion = userData["results"][0]["question"].stringValue
        let tempQuestion2 = tempQuestion.replacingOccurrences(of: "&quot;", with: "\"", options: .literal, range: nil)
        let tempQuestion3 = tempQuestion2.replacingOccurrences(of: "&ldquo;", with: "\"", options: .literal, range: nil)
        let tempQuestion4 = tempQuestion2.replacingOccurrences(of: "&rdquo;", with: "\"", options: .literal, range: nil)
        let question1 = tempQuestion4.replacingOccurrences(of: "&#039;", with: "'", options: .literal, range: nil)
        //   question1 = tempQuestion.replacingOccurrences(of: "&quot;", with: "", options: .literal, range: nil)
        
        
        correctAnswer = userData["results"][0]["correct_answer"].stringValue
        print(correctAnswer)
        
        
        info = question1
        
        var answerArray = userData["results"][0]["incorrect_answers"].arrayValue
        
        // Random answers generated
        
        let randomNumber = Int(arc4random_uniform(3))
        
        answerArray.insert(userData["results"][0]["correct_answer"], at: randomNumber)
        
        answer = answerArray[0].stringValue
        answerDisplay2 = answerArray[1].stringValue
        answerDisplay3 = answerArray[2].stringValue
        answerDisplay4 = answerArray[3].stringValue
        
        self.questionLabel.text = info
        self.answerA.setTitle(answer, for: .normal)
        self.answerB.setTitle(answerDisplay2, for: .normal)
        self.answerC.setTitle(answerDisplay3, for: .normal)
        self.answerD.setTitle(answerDisplay4, for: .normal)
        
        numberOfQuestionsAnswered = numberOfQuestionsAnswered + 1
    
        if numberOfQuestionsAnswered >= 10{
        
                        performSegue(withIdentifier: "toEndScreenSegue", sender: self)
                    
                }
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        // 2
        if identifier == "toEndScreenSegue" {
            
            let destination = segue.destination as! endScreenController
            destination.score = score
        }
        
    }
    
}
