//
//  SelectionViewController.swift
//  Rock Paper Scissors
//
//  Created by Vineet Joshi on 1/9/18.
//  Copyright © 2018 Vineet Joshi. All rights reserved.
//

import UIKit


let TAG_TO_MOVE = [0: "rock", 1: "paper", 2: "scissors"]

func generateRandomMove() -> Int {
    return Int(arc4random() % 3)
}


class SelectionViewController: UIViewController {
    
    @IBAction func moveMade(_ sender: Any) {
        let tag = (sender as! UIButton).tag
        if tag == 0 {
            // present the result using code
            let nextController = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
            nextController.playerMove = "rock"
            nextController.cpuMove = TAG_TO_MOVE[generateRandomMove()]!
            self.present(nextController, animated: true, completion: nil)
        } else if tag == 1 {
            // present the result using code and segue
            self.performSegue(withIdentifier: "paper", sender: self)
        }
        // otherwise, scissors got selected and the result will be presented using segue with no code!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextController = segue.destination as! ResultsViewController
        nextController.playerMove = segue.identifier
        nextController.cpuMove = TAG_TO_MOVE[generateRandomMove()]!
    }
    
}

