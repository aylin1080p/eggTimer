//
//  ViewController.swift
//  eggTimer
//
//  Created by Aylin GÜNEŞ on 5.02.2023.
//

import UIKit

class ViewController: UIViewController {

    
   let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720] // second
   var secondsRemaining = 60
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle! // soft, medium, hard
        print(eggTimes[hardness]!) // when user clicks we get value from eggtimes dictionary-its not necessary line
        
        secondsRemaining = eggTimes[hardness]!
        
       timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    @objc func updateTimer(){
        if secondsRemaining > 0 {
            print("time: \(secondsRemaining)")
            secondsRemaining -= 1
        }
    }


}

