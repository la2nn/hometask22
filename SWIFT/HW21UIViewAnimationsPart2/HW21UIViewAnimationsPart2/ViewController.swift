//
//  ViewController.swift
//  HW21UIViewAnimationsPart2
//
//  Created by Nick on 21.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isMoveRight = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bird = UIImageView(frame: CGRect(x: -67, y: self.view.frame.height / 1.85 , width: 256, height: 256))
        let background = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        background.image = UIImage(named: "background.png")
        background.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        self.view.addSubview(background)

        var birdFlying: Array <UIImage> = []
        let pos0 = UIImage(named: "frame_0_delay-0.08s.gif")
        let pos1 = UIImage(named: "frame_1_delay-0.08s.gif")
        let pos2 = UIImage(named: "frame_2_delay-0.08s.gif")
        let pos3 = UIImage(named: "frame_3_delay-0.08s.gif")
        let pos4 = UIImage(named: "frame_4_delay-0.08s.gif")
        let pos5 = UIImage(named: "frame_5_delay-0.08s.gif")
        let pos6 = UIImage(named: "frame_6_delay-0.08s.gif")
        let pos7 = UIImage(named: "frame_7_delay-0.08s.gif")
        let pos8 = UIImage(named: "frame_8_delay-0.08s.gif")
        
        if let pos = pos0 { birdFlying.append(pos) }
        if let pos = pos1 { birdFlying.append(pos) }
        if let pos = pos2 { birdFlying.append(pos) }
        if let pos = pos3 { birdFlying.append(pos) }
        if let pos = pos4 { birdFlying.append(pos) }
        if let pos = pos5 { birdFlying.append(pos) }
        if let pos = pos6 { birdFlying.append(pos) } 
        if let pos = pos7 { birdFlying.append(pos) }
        if let pos = pos8 { birdFlying.append(pos) }
        
        bird.animationImages = birdFlying
        bird.animationDuration = 0.6
        bird.startAnimating()
        
        self.view.addSubview(bird)
 
        self.moveBird(bird: bird)
    }

    func moveBird(bird: UIImageView) {

        let heightToFly = Int.random(in: Int(bird.frame.height)...Int(self.view.frame.height) - Int(bird.frame.height / 2) - 80)
        
        UIImageView.animate(withDuration: 4,
                            delay: 0,
                            options: [UIView.AnimationOptions.curveLinear],
                            animations: {
                                if self.isMoveRight {
                                    bird.center = CGPoint(x: Int(self.view.frame.width - 67) , y: heightToFly)
                                } else {
                                    bird.center = CGPoint(x: 67 , y: heightToFly)
                                }
                            },
                            completion: { (result: Bool) in
                                bird.transform = bird.transform.scaledBy(x: -1, y: 1)
                                self.isMoveRight = !self.isMoveRight
                                self.moveBird(bird: bird)
                            })
        
    }
    
}

