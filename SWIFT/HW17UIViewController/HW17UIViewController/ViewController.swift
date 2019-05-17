//
//  ViewController.swift
//  HW17UIViewController
//
//  Created by Nick on 16.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    func generateRandomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256               // use 256 to get full range from 0.0 to 1.0    // оттенок
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5  // from 0.5 to 1.0 to stay away from white      // насыщенность
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5  // from 0.5 to 1.0 to stay away from black      // яркость
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
        self.view.backgroundColor = generateRandomColor()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }

    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }
    
}

