//
//  ResultsViewController.swift
//  Rock Paper Scissors
//
//  Created by Vineet Joshi on 1/9/18.
//  Copyright © 2018 Vineet Joshi. All rights reserved.
//

import Foundation
import UIKit


let WIN = "You Win 😎 ✌️"
let LOSE = "You Lose 😢 👎"
let TIE = "It's A Tie 😶 🤝"

let MOVE_HASHMAP = ["rockpaper":("Paper Covers Rock", LOSE), "paperrock":("Paper Covers Rock", WIN),
                    "scissorsrock":("Rock Crushes Scissors", LOSE), "rockscissors":("Rock Crushes Scissors", WIN),
                    "paperscissors":("Scissors Cut Paper", LOSE), "scissorspaper":("Scissors Cut Paper", WIN)]


class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var playerMove: String?
    var cpuMove: String?
    
    override func viewWillAppear(_ animated: Bool) {
        if playerMove == cpuMove {
            resultImageView.image = UIImage(named: "ItsATie")
            resultLabel.text = TIE
        } else {
            let message = MOVE_HASHMAP[playerMove! + cpuMove!]!.0
            resultImageView.image = UIImage(named: message.replacingOccurrences(of: " ", with: ""))
            resultLabel.numberOfLines = 3
            resultLabel.text = message + ".\n\n" + MOVE_HASHMAP[playerMove! + cpuMove!]!.1
        }
    }
    
    @IBAction func playAgain() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
