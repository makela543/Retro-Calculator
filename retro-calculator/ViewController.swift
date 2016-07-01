//
//  ViewController.swift
//  retro-calculator
//
//  Created by Mark Laukkanen on 28/06/16.
//  Copyright © 2016 Mark Laukkanen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Equals = "="
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }

    @IBAction func numPressed(btn: UIButton!) {
        playSound()
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func onDividePressed(btn: UIButton!) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(btn: UIButton!) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(btn: UIButton!) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(btn: UIButton!) {
        processOperation(Operation.Add)
    }

    @IBAction func onEqualPressed(btn: UIButton!) {
        processOperation(Operation.Equals)
    }
    
    func processOperation(op: Operation) {
        playSound()
        currentOperation = op
    }
    
    func playSound() {
        if btnSound.playing {
            btnSound.stop()
        }
        
        btnSound.play()
    }
    
    
}

