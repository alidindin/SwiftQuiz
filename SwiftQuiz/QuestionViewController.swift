//
//  QuestionViewController.swift
//  SwiftQuiz
//
//  Created by Garrit Schaap on 18.04.16.
//  Copyright © 2016 Garrit Schaap. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var answer1Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answer1ButtonHandler(sender: AnyObject) {
        print("Falsch")
    }
    
    @IBAction func answer2ButtonHandler(sender: AnyObject) {
        print("Richtig")
    }
    
    @IBAction func answer3ButtonHandler(sender: AnyObject) {
        print("Falsch")
    }
    
    @IBAction func answer4ButtonHandler(sender: AnyObject) {
        print("Falsch")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
