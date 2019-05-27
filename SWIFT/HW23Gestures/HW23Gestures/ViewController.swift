//
//  ViewController.swift
//  HW23Gestures
//
//  Created by Nick on 26.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var transformMatrix: CGAffineTransform!
    var imageView: UIImageView!
    var scale: CGFloat!
    var rotation: CGFloat!
    var shouldStopAnimating = true
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.width / 2
        let height = self.view.frame.width / 3
            
        imageView = UIImageView(frame: CGRect(x: self.view.frame.midX - width / 2, y: self.view.frame.midY - height / 2, width: width, height: height))
        let image1 = UIImage(named: "frame_0_delay-0.08s.png")
        let image2 = UIImage(named: "frame_1_delay-0.08s.png")
        let image3 = UIImage(named: "frame_2_delay-0.08s.png")
        let image4 = UIImage(named: "frame_3_delay-0.08s.png")
        images = [image1!, image2!, image3!, image4!]
        imageView.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        imageView.animationImages = images
        imageView.animationDuration = 0.25
        imageView.startAnimating()
        self.view.addSubview(imageView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(tap:)))
        self.view.addGestureRecognizer(tap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(doubleTap:)))
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
        tap.require(toFail: doubleTap)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeRight(swipeRight:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeLeft(swipeLeft:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(pinch:)))
        self.view.addGestureRecognizer(pinch)
        
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(rotation:)))
        self.view.addGestureRecognizer(rotation)
       
        rotation.delegate = self
        pinch.delegate = self
       
        self.transformMatrix = self.imageView.transform

    }
    
    @objc func handleRotation(rotation: UIRotationGestureRecognizer) {
        if (rotation.state == .began) {
            self.rotation = 0
        }
        
        let newRotation = rotation.rotation - self.rotation
        
        let newTransform = self.transformMatrix.rotated(by: newRotation)
        self.imageView.transform = newTransform
        self.transformMatrix = self.imageView.transform
        
        self.rotation = rotation.rotation
    }
    
    @objc func handleDoubleTap(doubleTap: UITapGestureRecognizer) {
        if shouldStopAnimating {
            self.imageView.stopAnimating()
            self.imageView.animationImages = [images[Int.random(in: 0...3)]]
            self.imageView.startAnimating()
        } else {
            self.imageView.stopAnimating()
            self.imageView.animationImages = images
            self.imageView.startAnimating()
        }
        shouldStopAnimating = !shouldStopAnimating
    }
    
    @objc func handlePinch(pinch: UIPinchGestureRecognizer) {
        if (pinch.state == .began) {
            self.scale = 1.0
        }
        
        let newScale = 1.0 + pinch.scale - self.scale
        
        let currentTransform = self.transformMatrix!
        let newTransform = currentTransform.scaledBy(x: newScale, y: newScale)
        self.imageView.transform = newTransform
        
        self.transformMatrix = newTransform
        self.scale = pinch.scale
        
    }
    
    @objc func handleTap(tap: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.8,
                       animations: { self.imageView.center = tap.location(in: self.view) })
    }
    
    @objc func handleSwipeRight(swipeRight: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 1.5,
                       animations: {
                        self.imageView.transform = self.transformMatrix!.rotated(by: CGFloat.pi * 2/3)
                        self.imageView.transform = self.transformMatrix!.rotated(by: 23)
                        self.imageView.transform = self.transformMatrix!.rotated(by: 0)
        })
        
        
    }
    
    @objc func handleSwipeLeft(swipeLeft: UISwipeGestureRecognizer) {

        UIView.animate(withDuration: 1.5,
                       animations: {
                        self.imageView.transform = self.transformMatrix!.rotated(by: -CGFloat.pi * 2 / 3 )
                        self.imageView.transform = self.transformMatrix!.rotated(by: -23)
                        self.imageView.transform = self.transformMatrix!.rotated(by: 0)
        })
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
