//
//  ViewController.swift
//  SwiftQuiz
//
//  Created by Garrit Schaap on 18.04.16.
//  Copyright © 2016 Garrit Schaap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question1 = Question(text: "Die Dinosaurier lebten...?", answer1: "mit Schulden", answer2: "knietief im Dispo", answer3: "auf Pump", answer4: "in der Kreide", rightAnswer: 4)
        questions.append(question1)
        let question2 = Question(text: "Scotty, der Ingenieur des Raumschiffs Enterprise, war bei den \"Ausflügen\" meist nicht dabei, weil er...?", answer1: "selbstständige", answer2: "angestellte", answer3: "beamte", answer4: "vorgesetzte", rightAnswer: 3)
        questions.append(question2)
        let question3 = Question(text: "Hans Albers, Karl Lagerfeld und Helmut Schmidt sind allesamt...?", answer1: "erfolgreiche Döner", answer2: "prominente Pommes", answer3: "berühmte Hamburger", answer4: "legendäre Würstchen", rightAnswer: 3)
        questions.append(question3)
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
            controller.questions = questions
        }
    }

}

