//
//  ViewController.swift
//  HW25UIButton
//
//  Created by Nick on 01.06.2019.
//  Copyright © 2019 nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultDisplay: UILabel!
    @IBOutlet weak var operatorDisplay: UILabel!
    
    let actionList = ["+", "-", "*", "/", "%"]
    
    @IBAction func actionNumbers(_ sender: UIButton) {
     //  if actionList.contains(arrayOfCurrentActions.last ?? "") || arrayOfCurrentActions.isEmpty {
        
            inputingNumbersIsBegin = true
            
            if afterResultButton {
                arrayOfCurrentActions[arrayOfCurrentActions.count - 1].append(String(sender.tag))
                resultDisplay.text = ""
            
                resultDisplay.text = arrayOfCurrentActions[arrayOfCurrentActions.count - 1]
                operatorDisplay.text?.append(String(sender.tag))
                return
            }
            
            resultDisplay.text?.append(String(sender.tag))
            operatorDisplay.text?.append(String(sender.tag))
            currentNumber.append(String(sender.tag))
        
            afterResultButton = false
    }
    
    @IBAction func actionBackspace(_ sender: UIButton) {
        if !operatorDisplay.text!.isEmpty {
            
            if inputingNumbersIsBegin && !currentNumber.isEmpty {
                resultDisplay.text?.removeLast()
                operatorDisplay.text?.removeLast()
                currentNumber.removeLast()
                return
            }
            
            if !arrayOfCurrentActions.isEmpty {
                var tmp = [String]()
                arrayOfCurrentActions.compactMap { $0.forEach { tmp.append(String($0))} }
                
                tmp.removeLast()
                arrayOfCurrentActions.removeAll()
                
                var content = ""
                
                for element in tmp {
                    content += element
                    if actionList.contains(element) {
                        content.removeLast()
                        arrayOfCurrentActions.append(content)
                        arrayOfCurrentActions.append(element)
                        content.removeAll()
                    }
                }
                
                arrayOfCurrentActions.append(content)
            }
            operatorDisplay.text?.removeLast()
        }
        
        arrayOfCurrentActions = arrayOfCurrentActions.filter { $0 != "" }
        print(arrayOfCurrentActions)
        
    }
    
    @IBAction func actionDot(_ sender: UIButton) {
        if !(resultDisplay.text?.contains(".") ?? false) && inputingNumbersIsBegin {
            currentNumber.append(".")
            operatorDisplay.text?.append(".")
            resultDisplay.text?.append(".")
        }
    }
    
    @IBAction func actionClear(_ sender: UIButton) {
        currentNumber = ""
        resultDisplay.text = ""
        operatorDisplay.text = ""
        
        inputingNumbersIsBegin = false
        afterResultButton = false
        
        arrayOfCurrentActions.removeAll()
    }
    
    @IBAction func actionSum(_ sender: UIButton) {
        doAction(action: "+")
    }
    
    @IBAction func actionMinus(_ sender: UIButton) {
        doAction(action: "-")
    }
    
    func doAction(action: String) {
        
        if actionList.contains(arrayOfCurrentActions.last ?? "") && !inputingNumbersIsBegin{
            arrayOfCurrentActions[arrayOfCurrentActions.count - 1] = action
            operatorDisplay.text?.removeLast()
            operatorDisplay.text?.append(action)
        }
        
        if !actionList.contains(arrayOfCurrentActions.last ?? "") || inputingNumbersIsBegin {
          
            if currentNumber != "" {
                arrayOfCurrentActions.append(currentNumber)
                currentNumber = ""
            }
            
            operatorDisplay.text?.append(action)
            resultDisplay.text = ""
            arrayOfCurrentActions.append(action)
            
            inputingNumbersIsBegin = false
        }
    }
    
    @IBAction func actionResult(_ sender: UIButton) {
        
        if currentNumber != "" {
            arrayOfCurrentActions.append(currentNumber)
            currentNumber = ""
        }
        
        var result: Double = 0

        if !arrayOfCurrentActions.isEmpty {
            print(arrayOfCurrentActions)
            
            if actionList.contains(arrayOfCurrentActions.first!) && arrayOfCurrentActions.count > 1 {
                result = Double(arrayOfCurrentActions[1])! * Double(arrayOfCurrentActions[0] + "1")!
            } else {
                result = Double(arrayOfCurrentActions[0])! * 1.0
            }
            
            for i in 1..<arrayOfCurrentActions.count {
                if i != arrayOfCurrentActions.count - 1 {
                    switch arrayOfCurrentActions[i] {
                    case "+": result += Double(arrayOfCurrentActions[i + 1]) ?? 0
                    case "-": result -= Double(arrayOfCurrentActions[i + 1]) ?? 0
                    default: break
                    }
                }
            }
            resultDisplay.text = String(result) + currentNumber
            afterResultButton = true
        }
    }
    
    var inputingNumbersIsBegin = false
    var afterResultButton = false
    var currentNumber = ""
    var arrayOfCurrentActions = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
       // resultDisplay.text = "sad"
        /*    let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 300), NSAttributedString.Key.foregroundColor : UIColor.yellow]
         let string = NSAttributedString(string: "NAJAL", attributes: attributes)
         
         let button = UIButton(type: .custom)
         button.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
         button.setTitleColor(.red, for: .normal)
         button.setTitleColor(.black, for: .highlighted)
         
         button.setAttributedTitle(string, for: .highlighted)
         button.setTitle("YO WUSSYUP", for: .normal)
         // button.setTitle("NAJAL", for: .highlighted)
         self.view.addSubview(button)
         
         button.addTarget(self, action: #selector(actionTest(_:)), for: UIControl.Event.touchUpInside)
         }
         
         @objc func actionTest(_ sender: UIButton) {
         print("URA")
         } */
    }


}

