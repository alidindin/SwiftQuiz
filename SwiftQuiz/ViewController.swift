//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by Garrit Schaap on 18.04.16.
//  Copyright © 2016 Garrit Schaap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var questionsCategory1 = [Question]()
        
        let question1C1 = Question(text: "Was ist 2*2", answer1: "1", answer2: "2", answer3: "3", answer4: "4", rightAnswer: 4)
        questionsCategory1.append(question1C1)
        let question2C1 = Question(text: "Was ist 1*1", answer1: "1", answer2: "2", answer3: "3", answer4: "4", rightAnswer: 1)
        questionsCategory1.append(question2C1)
        
        let category1 = Category(title: "Mathe", questions: questionsCategory1)
        categories.append(category1)
        
        var questionsCategory2 = [Question]()
        
        let question1C2 = Question(text: "Die Dinosaurier lebten...?", answer1: "mit Schulden", answer2: "knietief im Dispo", answer3: "auf Pump", answer4: "in der Kreide", rightAnswer: 4)
        questionsCategory2.append(question1C2)
        let question2C2 = Question(text: "Scotty, der Ingenieur des Raumschiffs Enterprise, war bei den \"Ausflügen\" meist nicht dabei, weil er...?", answer1: "selbstständige", answer2: "angestellte", answer3: "beamte", answer4: "vorgesetzte", rightAnswer: 3)
        questionsCategory2.append(question2C2)
        
        let category2 = Category(title: "Dumme Fragen", questions: questionsCategory2)
        categories.append(category2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButtonHandler(sender: AnyObject) {
        print("Button tapped!")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? QuestionViewController {
            let index = Int(arc4random()) % categories.count
            controller.questions = categories[index].questions
            controller.numberOfQuestions = categories[index].questions.count
        }
    }

}


