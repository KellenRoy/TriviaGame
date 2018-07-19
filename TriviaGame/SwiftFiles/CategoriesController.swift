//
//  Categories.swift
//  TriviaGame
//
//  Created by Kellen Roy on 7/16/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class CategoriesController: UIViewController {
    
    @IBOutlet weak var generalButton: UIButton!
    @IBOutlet weak var moviesButton: UIButton!
    @IBOutlet weak var gamesButton: UIButton!
    @IBOutlet weak var sportsButton: UIButton!
    @IBOutlet weak var scienceButton: UIButton!
    @IBOutlet weak var historyButton: UIButton!
    
    var info: String?
    var scoreDisplay: String?
    var answer: String?
    var answerDisplay2: String?
    var answerDisplay3: String?
    var answerDisplay4: String?
    var score: Int = 0
    var url: NSURL?
    
    var correctAnswer: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setUpViews() {
        generalButton.layer.cornerRadius = 8
        generalButton.layer.masksToBounds = true
        
        moviesButton.layer.cornerRadius = 8
        moviesButton.layer.masksToBounds = true
        
        gamesButton.layer.cornerRadius = 8
        gamesButton.layer.masksToBounds = true
        
        sportsButton.layer.cornerRadius = 8
        sportsButton.layer.masksToBounds = true
        
        scienceButton.layer.cornerRadius = 8
        scienceButton.layer.masksToBounds = true
        
        historyButton.layer.cornerRadius = 8
        historyButton.layer.masksToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        // 2
        if identifier == "toQuestion" {
        
        let destination = segue.destination as! questionAnswerController
        destination.info = info
        destination.answer = answer
        destination.answerDisplay2 = answerDisplay2
        destination.answerDisplay3 = answerDisplay3
        destination.answerDisplay4 = answerDisplay4
        destination.correctAnswer = correctAnswer
        destination.url = url
        }
    }

    
    @IBAction func generalButtonPressed(_ sender: Any) {
        
        let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=9&type=multiple")
        categorySelected(url: url!)
        
    }
    
    @IBAction func moviesButtonPressed(_ sender: Any) {
        let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=11&type=multiple")
        categorySelected(url: url!)
        
    }
    
    @IBAction func gamesButtonPressed(_ sender: Any) {
        let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=15&type=multiple")
        categorySelected(url: url!)
    }
    
    
    @IBAction func sportsButtonPressed(_ sender: Any) {
       
        
        let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=21&type=multiple")
        categorySelected(url: url!)
        
    }
    
    @IBAction func scienceButtonPressed(_ sender: Any) {
        let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=17&type=multiple")
        categorySelected(url: url!)
    }
        
        
    
    
    @IBAction func historyButtonPressed(_ sender: Any) {
        
        let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=23&type=multiple")
        categorySelected(url: url!)
    }
    
    func categorySelected(url: NSURL) {
        
        self.url = url
        let jsonData = try! Data(contentsOf: url as URL)
        let userData = try! JSON(data: jsonData)
        let tempQuestion = userData["results"][0]["question"].stringValue
        
        let question1 = tempQuestion.replacingOccurrences(of: "&#039;", with: "'", options: .literal, range: nil)
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
        
        
        performSegue(withIdentifier: "toQuestion", sender: self)
    }
 
}
    
    
    

