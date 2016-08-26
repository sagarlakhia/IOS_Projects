//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Ishan Lakhia on 8/25/16.
//  Copyright © 2016 Sagar Lakhia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    var runningNumber=""
    
    
    var btnSound : AVAudioPlayer!
    var leftValStr=""
    var rightValStr=""
    var result=""
    
    
    enum Operation: String{
        case Divide="/"
        case Multiply="*"
        case Addition="+"
        case Subtraction="-"
        case Empty="Empty"
    }
    var currentOperation = Operation.Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        
        do{
            
            try btnSound=AVAudioPlayer(contentsOf: soundUrl)
            btnSound.prepareToPlay()
            
        }catch let err as NSError{
            print(err.debugDescription)
            
            
        }
    outputLbl.text="0"
        
        
    }

    @IBAction func clearAll(_ sender: AnyObject) {
         leftValStr=""
         rightValStr=""
         result=""
         outputLbl.text="0"
        currentOperation=Operation.Empty

    }
    @IBAction func onDividePressed(sender:AnyObject){
        processOperation(operation: Operation.Divide)
    }
    
    
    @IBAction func onMultiplyPressed(sender:AnyObject){
        processOperation(operation: Operation.Multiply)
    }
    
    @IBAction func onAddPressed(sender:AnyObject){
        processOperation(operation: Operation.Addition)
    }
    
    @IBAction func onSubtractPressed(sender:AnyObject){
        processOperation(operation: Operation.Subtraction)
    }
    
    @IBAction func onEqualPressed(sender:AnyObject){
        processOperation(operation: currentOperation)
    }
    
    
    
    @IBAction func numberPressed(_ sender: AnyObject) {
        
        playSound()
        runningNumber+="\(sender.tag!)"
        outputLbl.text=runningNumber
        
        
    }
    
    func playSound(){
        
        if btnSound.isPlaying{
            btnSound.stop()
        }
        else{
            btnSound.play()
        }
        
        
    }
    
    func processOperation(operation : Operation)
    {
        playSound()
        if (currentOperation != Operation.Empty)
        {
            //User selected an operator, but then selected annother operator without first entering a number
            
            if runningNumber != ""{
                rightValStr = runningNumber
                runningNumber=""
            
            
                if currentOperation == Operation.Multiply{
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                }else if currentOperation == Operation.Divide{
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }else if currentOperation == Operation.Subtraction{
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }else if currentOperation == Operation.Addition{
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLbl.text=result
                
            }
            
            currentOperation = operation
                
        }
            //First time operator is pressed
        else{
            
            leftValStr=runningNumber
            runningNumber=""
            currentOperation=operation
        }
        
    }
    
}

