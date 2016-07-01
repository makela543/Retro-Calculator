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

    @IBOutlet weak var outputLbl: UILabel!
    
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    
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
        btnSound.play()
    }
    
    @IBAction func onDividePressed(btn: UIButton!) {
        
    }
    
    @IBAction func onMultiplyPressed(btn: UIButton!) {
        
    }
    
    @IBAction func onSubtractPressed(btn: UIButton!) {
        
    }
    
    @IBAction func onAddPressed(btn: UIButton!) {
        
    }

    @IBAction func onEqualPressed(btn: UIButton!) {
        
    }
    
}

