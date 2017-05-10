//
//  ViewController.swift
//  BetWinPercent
//
//  Created by iOS on 10/05/17.
//  Copyright © 2017 iOS. All rights reserved.
//

import UIKit
import Darwin
class ViewController: UIViewController , UITextFieldDelegate{

    var betCoeff = Double()
    var betCoeffHome = Double()
    var betCoeffDraw = Double()
    var betCoeffAway = Double()


    
    @IBOutlet weak var awayResultLabel: UILabel!
    @IBOutlet weak var drawResultLabel: UILabel!
    @IBOutlet weak var homeResultLabel: UILabel!
    @IBOutlet weak var awayTextField: UITextField!
    @IBOutlet weak var drawTextField: UITextField!
    @IBOutlet weak var homeTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculateDidTap(_ sender: Any) {
        if homeTextField.text?.characters.count==0 || drawTextField.text?.characters.count==0 || awayTextField.text?.characters.count==0{
            return
        }
        let inputA =  NumberFormatter().number(from: awayTextField.text!)?.doubleValue
        let partialResultA = 100 / inputA!
        
        let inputD =  NumberFormatter().number(from: drawTextField.text!)?.doubleValue
        let partialResultD = 100 / inputD!
        
        let inputH =  NumberFormatter().number(from: homeTextField.text!)?.doubleValue
        let partialResultH = 100 / inputH!
    
        
        
        let rightA = partialResultA * 100
        let rightD = partialResultD * 100
        let rightH = partialResultH * 100

        betCoeff = rightA + rightD + rightH
        betCoeff = betCoeff / 100


        let totalResultA = rightA / betCoeff
        let totalResultD = rightD / betCoeff
        let totalResultH = rightH / betCoeff

        drawResultLabel.text = String(totalResultD.roundTo(places: 1))
        awayResultLabel.text = String(totalResultA.roundTo(places: 1))
        homeResultLabel.text = String(totalResultH.roundTo(places: 1))
        
        closekeyboard() //close keyboard when click


    }
    
   
    
   
    
    
    // MARK: Helper Methods
    func closekeyboard() {
        self.view.endEditing(true)
        
    }
    
    // MARK: Touch Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        closekeyboard()
    }
    
    
    
}

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
