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
    
    var question: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answer1ButtonHandler(sender: UIButton) {
        print("Falsch")
        sender.backgroundColor = UIColor.redColor()
    }
    
    @IBAction func answer2ButtonHandler(sender: UIButton) {
        print("Richtig")
        sender.backgroundColor = UIColor.greenColor()
        
        let alertController = UIAlertController(title: "Richtig", message: "Super!", preferredStyle: .Alert)
        let action = UIAlertAction(title: "🤘", style: .Default) { (_) in
            alertController.dismissViewControllerAnimated(true, completion: { 
//                self.navigationController?.popToRootViewControllerAnimated(true)
            })
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        alertController.addAction(action)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func answer3ButtonHandler(sender: UIButton) {
        print("Falsch")
        sender.backgroundColor = UIColor.redColor()
    }
    
    @IBAction func answer4ButtonHandler(sender: UIButton) {
        print("Falsch")
        sender.backgroundColor = UIColor.redColor()
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
