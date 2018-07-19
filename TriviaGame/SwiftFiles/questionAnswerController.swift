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
        let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=9&type=multiple")
        
        
        let jsonData = try! Data(contentsOf: url! as URL)
        let userData = try! JSON(data: jsonData)
       
        if (answerA.titleLabel?.isEqual(userData["results"][0]["correct_answer"].stringValue))!  {
            score = score + 1
            scoreLabel.text = "Score: \(score)/10"
            nextQuestion()
        }
        else { nextQuestion() }
    
    }
    
    @IBAction func answerBPressed(_ sender: Any) {
        let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=9&type=multiple")
        
        
        let jsonData = try! Data(contentsOf: url! as URL)
        let userData = try! JSON(data: jsonData)
        
        if (answerA.titleLabel?.isEqual(userData["results"][0]["correct_answer"].stringValue))!  {
            score = score + 1
            scoreLabel.text = "Score: \(score)/10"
            nextQuestion()
        }
        else { nextQuestion() }
    }
    
    @IBAction func answerCPressed(_ sender: Any) {
        let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=9&type=multiple")
        
        
        let jsonData = try! Data(contentsOf: url! as URL)
        let userData = try! JSON(data: jsonData)
        
        if (answerA.titleLabel?.isEqual(userData["results"][0]["correct_answer"].stringValue))!  {
            score = score + 1
            scoreLabel.text = "Score: \(score)/10"
            nextQuestion()
        }
        else { nextQuestion() }
    }
    
    @IBAction func answerDPressed(_ sender: Any) {
        let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=9&type=multiple")
        
        
        let jsonData = try! Data(contentsOf: url! as URL)
        let userData = try! JSON(data: jsonData)
        
        if (answerA.titleLabel?.isEqual(userData["results"][0]["correct_answer"].stringValue))!  {
            score = score + 1
            scoreLabel.text = "Score: \(score)/10"
            nextQuestion()
        }
        else { nextQuestion() }
    }
    
    func nextQuestion() {
        
    }
}
