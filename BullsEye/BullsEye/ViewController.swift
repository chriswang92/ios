//
//  ViewController.swift
//  BullsEye
//
//  Created by WangChenguang on 2016-03-07.
//  Copyright (c) 2016 WangChenguang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue: Int = 0
    var roundCount: Int = 0
    var scoreSUM: Int = 0
    var score:Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showAlert() {
        var diff = abs(currentValue - targetValue)
        /*
        if diff < 0 {
            diff = -diff
        }
        */
        /*
        if currentValue > targetValue{
            diff = currentValue - targetValue
        }else if currentValue < targetValue{
            diff = targetValue - currentValue
        }else{
            diff = 0
        }
        */
        
        /*
        if diff < 5{
            score = 100
        }else if diff < 10 && diff > 5{
            score = 50
        }else if diff < 20 && diff > 10{
            score = 25
        }else if diff < 30 && diff > 20{
            score = 5
        }else{
            score = 0
        }
        */
        score = 100 - diff
        
        let title : String
        if diff == 0{
            title = "Perfect!"
            score += 100
        }else if diff < 5{
            title = "You almost had it"
            score += 50
        }else if diff < 10{
            title = "Pretty good"
        }else{
            title = "Not even close"
        }
        
        scoreSUM = scoreSUM + score
        
        let message = "You scored \(score) points"
        
        let alert = UIAlertController(title: title,
            message: message,
            preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default,
            handler: { action in
            self.startNewRound()
            self.updateLabels()
            })
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        roundCount = roundCount + 1
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        roundLabel.text = String(roundCount)
        scoreLabel.text = String(scoreSUM)
    }
    
    func startNewGame(){
        scoreSUM = 0
        roundCount = 0
        startNewRound()
    }
    
    @IBAction func startOver() {
        let alert2 = UIAlertController(title: "Start over?", message: "let's play again", preferredStyle: .Alert)
        let action2 = UIAlertAction(title: "YES", style: .Default, handler: { action in
        self.startNewGame()
        self.updateLabels()
        })
       alert2.addAction(action2)
        presentViewController(alert2, animated: true, completion: nil)
    }
    
}

