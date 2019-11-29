//
//  ViewController.swift
//  Calculator App
//
//  Created by Ebrahim Deen on 11/28/19.
//  Copyright © 2019 Ebrahim Deen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnscreen:Double = 0;
    var previousNumber:Double = 0;
    var performingmath = false
    var operation = 0;
    
    @IBOutlet weak var lable: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingmath == true
        {
            lable.text = String(sender.tag-1)
            numberOnscreen = Double(lable.text!)!
            performingmath = false
        }
        else{
            lable.text=lable.text! + String(sender.tag-1)
            numberOnscreen = Double(lable.text!)!
            
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if lable.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(lable.text!)!
            
            if sender.tag == 12 //divide
            {
                lable.text = "/";
            }
            else if sender.tag == 13 //multiply
            {
                lable.text = "*";
            }
            else if sender.tag == 14 //minus
            {
                lable.text = "-";
            }
            else if sender.tag == 15 //plus
            {
                lable.text = "+";
            }
            operation = sender.tag
            performingmath = true;
        }
        else if sender.tag == 16
        {
            if operation == 12{
                lable.text = String(previousNumber / numberOnscreen)
            }
            else if operation == 13{
                lable.text = String(previousNumber * numberOnscreen)
            }
            else if operation == 14{
                lable.text = String(previousNumber - numberOnscreen)
            }
             else if operation == 15{
                lable.text = String(previousNumber + numberOnscreen)
            }
        }
        else if sender.tag == 11
        {
            lable.text = ""
            previousNumber = 0;
            numberOnscreen = 0;
            operation = 0;
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

