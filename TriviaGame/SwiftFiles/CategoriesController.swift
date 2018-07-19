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
    var answer: String?
    var answerDisplay2: String?
    var answerDisplay3: String?
    var answerDisplay4: String?
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
        if identifier == "pressedGeneral" {
            print("Transitioning to the pressedGeneral View Controller")
        }
        
        let destination = segue.destination as! questionAnswerController
        destination.info = info
        destination.answer = answer
        destination.answerDisplay2 = answerDisplay2
        destination.answerDisplay3 = answerDisplay3
        destination.answerDisplay4 = answerDisplay4
    }

    
    @IBAction func generalButtonPressed(_ sender: Any) {
        let generalQuestions = "https://opentdb.com/api.php?amount=10&category=9&type=multiple"
        
        let url = NSURL(string: "https://opentdb.com/api.php?amount=10&category=9&type=multiple")
        
        
        let jsonData = try! Data(contentsOf: url! as URL)

        Alamofire.request(generalQuestions).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    //setup complete, code under here
                    

                    
                }
            case .failure(let error):
                print(error)
            }
        }

        let userData = try! JSON(data: jsonData)
        let question1 = userData["results"][0]["question"].stringValue
        /*
        let answer1 = userData["results"][0]["correct_answer"].stringValue
        let question2 = userData["results"][1]["question"].stringValue
        let question3 = userData["results"][2]["question"].stringValue
        let question4 = userData["results"][3]["question"].stringValue
        let question5 = userData["results"][4]["question"].stringValue
        let question6 = userData["results"][5]["question"].stringValue
        let question7 = userData["results"][6]["question"].stringValue
        let question8 = userData["results"][7]["question"].stringValue
        let question9 = userData["results"][8]["question"].stringValue
        let question10 = userData["results"][9]["question"].stringValue
        */
        
        info = question1
        
        var answerArray = userData["results"][0]["incorrect_answers"].arrayValue
        print("\(answerArray)")
       
        
        // Random answers generated
        
        let randomNumber = Int(arc4random_uniform(3))
        
        answerArray.insert(userData["results"][0]["correct_answer"], at: randomNumber)
        
        print("\(answerArray)")
        
        answer = answerArray[0].stringValue
        answerDisplay2 = answerArray[1].stringValue
        answerDisplay3 = answerArray[2].stringValue
        answerDisplay4 = answerArray[3].stringValue
        
        
        
    }
    
}
