//
//  ViewController.swift
//  HW19UIViewGeometry
//
//  Created by Nick on 17.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck: UIView!
    var shouldBeBlackNow = true
    var checkers = [UIView]()
    var isRotated = false
    
    override func loadView() {
        super.loadView()
        
        self.deck = UIView(frame: CGRect.init(x: 0, y: 104, width: 768, height: 816))
        self.view.addSubview(deck)
        self.deck.backgroundColor = UIColor.brown
        
        self.deck.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleLeftMargin.rawValue | UIView.AutoresizingMask.flexibleRightMargin.rawValue | UIView.AutoresizingMask.flexibleTopMargin.rawValue | UIView.AutoresizingMask.flexibleBottomMargin.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue )
        
        for i in 1...8 {
            for j in 1...8 {
                let chessCell = UIView(frame: CGRect.init(x: 24 + (j - 1) * 90, y: 768 - 90 * i, width: 90, height: 90))
                self.deck.addSubview(chessCell)
                chessCell.backgroundColor = (i % 2 == j % 2 ? UIColor.black : UIColor.white)
                chessCell.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleTopMargin.rawValue | UIView.AutoresizingMask.flexibleBottomMargin.rawValue)
                
                if (1...3) ~= i && chessCell.backgroundColor == UIColor.black {
                    let redCell = UIView(frame: CGRect.init(x: 24 + 15 + (j - 1) * 90, y: 726 + 42 + 15 - 90 * i, width: 60, height: 60))
                    self.deck.addSubview(redCell)
                    redCell.backgroundColor = UIColor.red
                    
                    redCell.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleTopMargin.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleBottomMargin.rawValue)
                    self.checkers.append(redCell)
                }
                
                if (6...8) ~= i && chessCell.backgroundColor == UIColor.black {
                    let whiteCell = UIView(frame: CGRect.init(x: 24 + 15 + (j - 1) * 90, y: 726 + 42 + 15 - 90 * i, width: 60, height: 60))
                    self.deck.addSubview(whiteCell)
                    whiteCell.backgroundColor = UIColor.white
                    
                    whiteCell.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleTopMargin.rawValue | UIView.AutoresizingMask.flexibleBottomMargin.rawValue)
                    self.checkers.append(whiteCell)
                }
            }
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for chessCell in self.deck.subviews {
            if !shouldBeBlackNow && chessCell.backgroundColor == UIColor.black { chessCell.backgroundColor = UIColor.green }
            if shouldBeBlackNow && chessCell.backgroundColor == UIColor.green { chessCell.backgroundColor = UIColor.black }
        }
        
        if self.isRotated {
            for _ in 0..<self.checkers.count {
                let checker1 = checkers[Int.random(in: 0..<self.checkers.count)]
                let checker2 = checkers[Int.random(in: 0..<self.checkers.count)]
                UIView.animate(withDuration: 1) {
                    let tempRect = checker1.frame
                    checker1.frame = checker2.frame
                    checker2.frame = tempRect
                    self.deck.bringSubviewToFront(checker1)
                    self.deck.bringSubviewToFront(checker2)
                }
            }
        }
        
        self.deck.center = CGPoint(x: self.view.frame.maxX / 2, y: self.view.frame.maxY / 2)
        
        shouldBeBlackNow = !shouldBeBlackNow
        self.isRotated = true
    }
}


// print("frame \(view.frame) ;  bounds \(view.bounds)")
// frame - положение описанного прямоугольника относительное superView + размеры
// bounds - положение относительно самого себя + размеры
// self.view.addSubview(viewUIView)
// let view = UIView(frame: CGRect)
// self.view.bringSubviewToFront(View)
// view.autoresizingMask = UIView.AutoresizingMask
