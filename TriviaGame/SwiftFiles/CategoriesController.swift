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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    
    override func prepare( for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        
        if identifier == "pressedSports" {
            print("Transitioning to the Categories View Controller")
        }
        if identifier == "pressedScience" {
            print("Transitioning to the Categories View Controller")
        }
        if identifier == "pressedGames" {
            print("Transitioning to the Categories View Controller")
        }
        if identifier == "pressedMovies" {
            print("Transitioning to the Categories View Controller")
        }
        if identifier == "pressedGeneral" {
            print("Transitioning to the Categories View Controller")
        }
        if identifier == "pressedHistory" {
            print("Transitioning to the Categories View Controller")
        }
        
    }
 
    @IBAction func generalButtonPressed(_ sender: Any) {

        let generalQuestions = "https://opentdb.com/api.php?amount=10&category=9&type=multiple"
        
        Alamofire.request(generalQuestions).validate().responseJSON() { response in
            switch response.result {
                case .success:
                if let value = response.result.value {
                let json = JSON(value)
    
    //setup complete, code under here
                    
        // example of JSON searching
        //let firstName = userData["results"][0]["name"]["first"].stringValue
                    
        
                    
        }
        case .failure(let error):
        print(error)
        }
        }
    }
    
}
