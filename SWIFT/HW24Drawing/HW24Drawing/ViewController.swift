//
//  ViewController.swift
//  HW24Drawing
//
//  Created by Nick on 28.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawingView: DrawingView!
    @IBOutlet weak var isRound: UISwitch!
    @IBOutlet weak var currentBrushView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var brush: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    @IBAction func redOne(_ sender: UIButton)
    { redColor = 1 ; greenColor = 0 ; blueColor = 0 ; currentBrushView.backgroundColor = currentColor ; changeSlidersValues(1, 0, 0) }
    
    @IBAction func greenOne(_ sender: UIButton)
    { redColor = 0 ; greenColor = 1 ; blueColor = 0 ; currentBrushView.backgroundColor = currentColor ; changeSlidersValues(0, 1, 0) }
    
    @IBAction func blueOne(_ sender: UIButton)
    { redColor = 0 ; greenColor = 0 ; blueColor = 1 ; currentBrushView.backgroundColor = currentColor ; changeSlidersValues(0, 0, 1) }
    
    @IBAction func purpleOne(_ sender: UIButton)
    { redColor = 0.5 ; greenColor = 0 ; blueColor = 0.5 ; currentBrushView.backgroundColor = currentColor ; changeSlidersValues(0.5, 0, 0.5) }
    
    @IBAction func yellowOne(_ sender: UIButton)
    { redColor = 1 ; greenColor = 1 ; blueColor = 0 ; currentBrushView.backgroundColor = currentColor ; changeSlidersValues(1, 1, 0) }
    
    @IBAction func cyanOne(_ sender: UIButton)
    { redColor = 0 ; greenColor = 1 ; blueColor = 1 ; currentBrushView.backgroundColor = currentColor ; changeSlidersValues(0, 1, 1) }
    
    @IBAction func brownOne(_ sender: UIButton)
    { redColor = 0.6 ; greenColor = 0.4 ; blueColor = 0.2 ; currentBrushView.backgroundColor = currentColor ; changeSlidersValues(0.6, 0.4, 0.2) }
    
    @IBAction func magentaOne(_ sender: UIButton)
    { redColor = 1 ; greenColor = 0 ; blueColor = 1 ; currentBrushView.backgroundColor = currentColor ; changeSlidersValues(1, 0, 1) }
    
    @IBAction func blackOne(_ sender: UIButton)
    { redColor = 0 ; greenColor = 0 ; blueColor = 0 ; currentBrushView.backgroundColor = currentColor ; changeSlidersValues(0, 0, 0) }
    
    func changeSlidersValues(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) {
       UIView.animate(withDuration: 0.4) {
            self.redSlider.setValue(Float(r) * 255, animated: true)
            self.greenSlider.setValue(Float(g) * 255, animated: true)
            self.blueSlider.setValue(Float(b) * 255, animated: true)
        }
       
    }
    
    var redColor: CGFloat = 0
    var greenColor: CGFloat = 0
    var blueColor: CGFloat = 0
    var brushSize: CGFloat = 15
    
    override func viewDidLoad() {
        currentBrushView.bounds = CGRect(x: -brushSize / 2, y: -brushSize / 2, width: brushSize, height: brushSize)
        currentBrushView.backgroundColor = currentColor
        super.viewDidLoad()
        self.view.addSubview(drawingView)
    }
    
    @IBAction func isRoundAction(_ sender: UISwitch) {
        UIView.animate(withDuration: 0.3) {
            if sender.isOn {
                self.currentBrushView.layer.cornerRadius = self.currentBrushView.frame.width / 2
            } else {
                self.currentBrushView.layer.cornerRadius = 0
            }
        }
        
    }
    
    @IBAction func clearScreen(_ sender: UIButton) {
        for subview in drawingView.subviews {
            subview.removeFromSuperview()
        }
    }
    
    @IBAction func brushSize(_ sender: UISlider) {
        sender.minimumValue = 5
        sender.maximumValue = 60
        brushSize = CGFloat(sender.value)
        changeCurrentBrushView()
    }
    
    @IBAction func redSlider(_ sender: UISlider) {
        sender.minimumValue = 0
        sender.maximumValue = 255
        redColor = CGFloat(sender.value / 255)
        changeCurrentBrushView()
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        sender.minimumValue = 0
        sender.maximumValue = 255
        greenColor = CGFloat(sender.value / 255)
        changeCurrentBrushView()
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        sender.minimumValue = 0
        sender.maximumValue = 255
        blueColor = CGFloat(sender.value / 255)
        changeCurrentBrushView()
    }
    
    var currentColor: UIColor {
        return UIColor(red: CGFloat(redColor), green: CGFloat(greenColor), blue: CGFloat(blueColor), alpha: 1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        draw(touch: touches.first!)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        draw(touch: touches.first!)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.drawingView.setNeedsDisplay()
    }
    
    func draw(touch: UITouch) {
        let location = touch.location(in: drawingView)
        if location.x < drawingView.frame.width - brushSize / 2 {
            brush = UIView(frame: CGRect(x: location.x - brushSize / 2, y: location.y - brushSize / 2, width: brushSize, height: brushSize))
            brush.backgroundColor = currentColor
            if isRound.isOn {
                brush.layer.cornerRadius = brushSize/2
            }
            self.drawingView.addSubview(brush)
        }
    }
    
    func changeCurrentBrushView() {
        currentBrushView.bounds = CGRect(x: -brushSize / 2, y: -brushSize / 2, width: brushSize, height: brushSize)
        currentBrushView.backgroundColor = currentColor
        
       if isRound.isOn {
            currentBrushView.layer.cornerRadius = currentBrushView.frame.width / 2
        } else {
            currentBrushView.layer.cornerRadius = 0
        }
    }

}

