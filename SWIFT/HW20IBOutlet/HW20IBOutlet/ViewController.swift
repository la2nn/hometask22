//
//  ViewController.swift
//  HW20IBOutlet
//
//  Created by Nick on 18.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var deck: UIView!
    @IBOutlet var redCheckers: [UIView]!
    @IBOutlet var blueCheckers: [UIView]!
    var isRotated = false
    var isBlackNow = false
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        isBlackNow = !isBlackNow
        
        if isRotated == true {
            for cell in self.deck.subviews {
                if cell.backgroundColor == UIColor.black && !isBlackNow { cell.backgroundColor = UIColor.green }
                if cell.backgroundColor == UIColor.green && isBlackNow { cell.backgroundColor = UIColor.black }
            }
            
            for _ in 0..<(blueCheckers.count + redCheckers.count) {
                let redOne = self.redCheckers![Int.random(in: 0..<redCheckers.count)]
                let blueOne = self.blueCheckers![Int.random(in: 0..<redCheckers.count)]
                
                UIView.animate(withDuration: 1) {
                    let tmpFrame = redOne.frame
                    redOne.frame = blueOne.frame
                    blueOne.frame = tmpFrame
                }
            }
        }
        
        isRotated = true
    }
}

