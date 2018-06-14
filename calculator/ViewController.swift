//
//  ViewController.swift
//  calculator
//
//  Created by BarryWang on 2018-03-15.
//  Copyright © 2018 BarryWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var NumberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    @IBOutlet var label: UILabel!
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            // this print is only for test purposes
            print(sender.tag-1)
            label.text = String(sender.tag-1)
            NumberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else
        {
            var string:String? = label.text
            if sender.tag == 0 && string != nil
                && (!(string!.contains(".")))
            {
                label.text = label.text! + "."
            }else{
                if sender.tag == 0{
                    
                }else{
                label.text = label.text! + String(sender.tag-1)
            }
            
        }
            
            print(label.text)
            NumberOnScreen = Double(label.text!)!
            
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        // tag 11 is clear, tag 16 is equal sign, tag 17 is delete
        // tag -1 is percentage sign
        if label.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 17 && sender.tag != -1
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 12//Divide
            {
                label.text = "/";
            }
            else if sender.tag == 13 //Muliply
            {
                label.text = "x";
            }
            else if sender.tag == 14 //Minus
            {
                label.text = "-";
            }
            else if sender.tag == 15 //Plus
            {
                label.text = "+";
            }
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 16
        {
            if operation == 12
            {
                label.text = String(previousNumber / NumberOnScreen)
            }
            else if operation == 13
            {
                label.text = String(previousNumber * NumberOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - NumberOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + NumberOnScreen)
            }
        }
        else if sender.tag == 17        // Delete button
            {
                // Notice when Double(""), we will get a 'nil' as return value
                label.text = String(label.text!.dropLast());
                if label.text != ""{
                    NumberOnScreen = Double(label.text!)!;
                }else{
                    NumberOnScreen = 0;
                    label.text = String("0");
                }

            }
        else if sender.tag == 11
            {
                label.text = "";
                previousNumber = 0;
                NumberOnScreen = 0;
                operation = 0;
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

