//
//  ViewController.swift
//  eggTimer
//
//  Created by Aylin GÜNEŞ on 5.02.2023.
//

import UIKit
import AVFoundation // for alarm

class ViewController: UIViewController {

    
   let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7] // second
   
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    var player: AVAudioPlayer? // for alarm

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var last: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
       timer.invalidate() // tekrarlı basışları geçersiz kılar
        let hardness = sender.currentTitle! // soft, medium, hard
        print(eggTimes[hardness]!) // when user clicks we get value from eggtimes dictionary-its not necessary line
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        topLabel.text = hardness
        
        timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    
    @objc func updateTimer(){
        if secondPassed < totalTime {
            
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime) // divides the elapsed time by the whole time
            print(Float(secondPassed) / Float(totalTime))
            
            
            
                        
        }else {
            timer.invalidate()
            last.text = "Done!"
            playSound()
        }
    }
    
   // alarm
    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

    

}

