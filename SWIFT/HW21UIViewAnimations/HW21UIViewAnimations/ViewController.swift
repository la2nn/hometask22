//
//  ViewController.swift
//  HW21UIViewAnimations
//
//  Created by Nick on 19.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let sideOfSquare = 90
    var isClockwise = Bool.random()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UIView(frame: CGRect.init(x: 0, y: 90 + 75, width: sideOfSquare, height: sideOfSquare))
        let view2 = UIView(frame: CGRect.init(x: 0, y: 180 + 105, width: sideOfSquare, height: sideOfSquare))
        let view3 = UIView(frame: CGRect.init(x: 0, y: 270 + 135, width: sideOfSquare, height: sideOfSquare))
        let view4 = UIView(frame: CGRect.init(x: 0, y: 360 + 165, width: sideOfSquare, height: sideOfSquare))
        let view5 = UIView(frame: CGRect.init(x: 0, y: 0, width: sideOfSquare, height: sideOfSquare))
        let view6 = UIView(frame: CGRect.init(x: self.view.frame.maxX - 90, y: 0, width: 90, height: 90))
        let view7 = UIView(frame: CGRect.init(x: self.view.frame.maxX - 90, y: self.view.frame.maxY - 90, width: 90, height: 90))
        let view8 = UIView(frame: CGRect.init(x: 0, y: self.view.frame.maxY - 90, width: 90, height: 90))
        
        self.view.addSubview(view1)
        self.view.addSubview(view2)
        self.view.addSubview(view3)
        self.view.addSubview(view4)
        
        for subview in self.view.subviews {
            subview.backgroundColor = self.randomColor()
            subview.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleTopMargin.rawValue | UIView.AutoresizingMask.flexibleBottomMargin.rawValue)
            self.moveViewHorizontally(view: subview)
        }
        
        self.view.addSubview(view5)
        self.view.addSubview(view6)
        self.view.addSubview(view7)
        self.view.addSubview(view8)
        
        for subview in self.view.subviews[4...7] {
            subview.backgroundColor = self.randomColor()
            subview.autoresizingMask = UIView.AutoresizingMask(rawValue:UIView.AutoresizingMask.flexibleTopMargin.rawValue | UIView.AutoresizingMask.flexibleBottomMargin.rawValue)
        }
    
         moveViewsInCorners()

    }
    
    func moveViewsInCorners() {
        UIView.animate(withDuration: 3,
                       delay: 0,
                       options: UIView.AnimationOptions(rawValue: UIView.AnimationOptions.curveEaseInOut.rawValue),
            animations: {
                
                for cornerView in self.view.subviews[4...7] {
                    cornerView.backgroundColor = self.randomColor()
                    
                    if self.isClockwise {
                        switch cornerView.center {
                            
                        case CGPoint(x: self.sideOfSquare / 2, y: self.sideOfSquare / 2) :
                            cornerView.center = CGPoint(x: Int(self.view.frame.maxX) - self.sideOfSquare / 2, y: self.sideOfSquare / 2)
                            
                        case CGPoint(x: Int(self.view.frame.maxX) - self.sideOfSquare / 2, y: self.sideOfSquare / 2) :
                            cornerView.center = CGPoint(x: Int(self.view.frame.maxX) - self.sideOfSquare / 2, y: Int(self.view.frame.maxY) - self.sideOfSquare / 2)
                            
                        case CGPoint(x: Int(self.view.frame.maxX) - self.sideOfSquare / 2, y: Int(self.view.frame.maxY) - self.sideOfSquare / 2) :
                            cornerView.center = CGPoint(x: self.sideOfSquare / 2, y: Int(self.view.frame.maxY) - self.sideOfSquare / 2)
                            
                        case CGPoint(x: self.sideOfSquare / 2, y: Int(self.view.frame.maxY) - self.sideOfSquare / 2):
                            cornerView.center = CGPoint(x: self.sideOfSquare / 2, y: self.sideOfSquare / 2)
                            
                        default: break
                        }
                    } else {
                        switch cornerView.center {
                            
                        case CGPoint(x: self.sideOfSquare / 2, y: self.sideOfSquare / 2) :
                            cornerView.center = CGPoint(x: self.sideOfSquare / 2, y: Int(self.view.frame.maxY) - self.sideOfSquare / 2)
                            
                        case CGPoint(x: Int(self.view.frame.maxX) - self.sideOfSquare / 2, y: self.sideOfSquare / 2) :
                            cornerView.center = CGPoint(x: self.sideOfSquare / 2, y: self.sideOfSquare / 2)
                            
                        case CGPoint(x: Int(self.view.frame.maxX) - self.sideOfSquare / 2, y: Int(self.view.frame.maxY) - self.sideOfSquare / 2) :
                            cornerView.center = CGPoint(x: Int(self.view.frame.maxX) - self.sideOfSquare / 2, y: self.sideOfSquare / 2)
                            
                        case CGPoint(x: self.sideOfSquare / 2, y: Int(self.view.frame.maxY) - self.sideOfSquare / 2):
                            cornerView.center = CGPoint(x: Int(self.view.frame.maxX) - self.sideOfSquare / 2, y: Int(self.view.frame.maxY) - self.sideOfSquare / 2)
                            
                        default: break
                        }
                    }
                }
        }) { (result: Bool) in
            self.isClockwise = Bool.random()
            self.moveViewsInCorners()
        }
        
    }
    
    func moveViewHorizontally(view: UIView) {
        let animationOptions = [UIView.AnimationOptions.curveEaseIn, UIView.AnimationOptions.curveEaseOut, UIView.AnimationOptions.curveEaseInOut, UIView.AnimationOptions.curveLinear]
        
        UIView.animate( withDuration: 5,
                        delay: 0,
                        options: UIView.AnimationOptions(rawValue: animationOptions[Int.random(in: 0...3)].rawValue | UIView.AnimationOptions.autoreverse.rawValue | UIView.AnimationOptions.repeat.rawValue),
                        animations: {
                            view.backgroundColor = self.randomColor()
                            let transform1 = CGAffineTransform.init(translationX: self.view.frame.maxX - view.bounds.maxX, y: 0)
                            let transform2 = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi * 359 / 360))
                            view.transform = transform2.concatenating(transform1)
        })
    }
    
    func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(256)) / 255
        let g = CGFloat(arc4random_uniform(256)) / 255
        let b = CGFloat(arc4random_uniform(256)) / 255
        return UIColor.init(red: r, green: g, blue: b, alpha: 1)
    }
    
    
    
}


// po self.view.subviews[4].center
// view.layer.removeAllAnimations()
// view.center = (self.k != 4 ? self.cornerViews[self.cornerViews.count - self.k].center : self.cornerViews[0].center)   // против часовой
// view.center = (self.i != 7 ? self.cornerViews[self.i - 4].center : self.cornerViews[0].center)                        // по часовой

