//
//  ViewController.swift
//  HW24DrawingV2
//
//  Created by Nick on 31.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawingView: UIImageView!
    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var redSliderValue: UISlider!
    @IBOutlet weak var greenSliderValue: UISlider!
    @IBOutlet weak var blueSliderValue: UISlider!
    @IBOutlet weak var alphaSliderValue: UISlider!
    @IBOutlet weak var currentBrushView: UIView!
    
    @IBAction func clearScreen(_ sender: UIButton) {
            self.drawingView.image = nil
    }
    
    @IBAction func redSlider(_ sender: UISlider) {
        redColor = CGFloat(sender.value)
         currentBrushView.backgroundColor = color
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        greenColor = CGFloat(sender.value)
         currentBrushView.backgroundColor = color
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        blueColor = CGFloat(sender.value)
        currentBrushView.backgroundColor = color
    }
    
    @IBAction func brushSizeSlider(_ sender: UISlider) {
        brushWidth = CGFloat(sender.value)
        currentBrushView.bounds = CGRect(x: -brushWidth / 2, y: -brushWidth / 2, width: brushWidth, height: brushWidth)
        currentBrushView.layer.cornerRadius = brushWidth / 2
    }
    
    @IBAction func alphaSlider(_ sender: UISlider) {
        opacity = CGFloat(sender.value)
        currentBrushView.alpha = opacity
    }
    
    @IBAction func getColorFromButton(_ sender: UIButton) {
        sender.backgroundColor?.getRed(&redColor, green: &greenColor, blue: &blueColor, alpha: &opacity)
        UIView.animate(withDuration: 0.3) {
            self.currentBrushView.backgroundColor = self.color
            self.alphaSliderValue.setValue( Float(self.opacity), animated: true)
            self.redSliderValue.setValue( Float(self.redColor), animated: true)
            self.greenSliderValue.setValue( Float(self.greenColor), animated: true)
            self.blueSliderValue.setValue( Float(self.blueColor), animated: true)
            
        }
        currentBrushView.alpha = opacity
    }
    
    var color: UIColor {
        return UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: opacity)
    }
    
    var redColor: CGFloat = 0
    var greenColor: CGFloat = 0
    var blueColor: CGFloat = 0
    var lastPoint = CGPoint.zero
    var brushWidth: CGFloat = 25.0
    var opacity: CGFloat = 1
    var swiped = false
    
    override func viewDidLoad() {
        currentBrushView.bounds = CGRect(x: -brushWidth / 2, y: -brushWidth / 2, width: brushWidth ,height: brushWidth)
        currentBrushView.backgroundColor = color
        currentBrushView.layer.cornerRadius = brushWidth / 2
        
        super.viewDidLoad()
        self.view.addSubview(drawingView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        let touch = touches.first!
        lastPoint = touch.location(in: drawingView)
    }
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContext(drawingView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        drawingView.draw(drawingView.bounds)

        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        
        context.strokePath()
        context.setAlpha(opacity)
        drawingView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        let touch = touches.first!
        let currentPoint = touch.location(in: drawingView)
        drawLine(from: lastPoint, to: currentPoint)
        lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLine(from: lastPoint, to: lastPoint)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLine(from: lastPoint, to: lastPoint)
        }
    }
    
}

