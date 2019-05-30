//
//  DrawingView.swift
//  HW24Drawing
//
//  Created by Nick on 28.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

import UIKit

class DrawingView: UIView {
    
    //
    override func draw(_ rect: CGRect) {
        
    }
    //
}


// ----------------------------------------------
/* let sqare2 = (CGRect(x: 200, y: 200, width: 100, height: 100))
 let sqare3 = (CGRect(x: 300, y: 300, width: 100, height: 100))
 
 context?.setStrokeColor(UIColor.blue.cgColor)
 context?.addRect(sqare1)
 context?.addRect(sqare2)
 context?.addRect(sqare3)
 context?.strokePath()
 
 context?.setFillColor(UIColor.green.cgColor)
 context?.addEllipse(in: sqare1)
 context?.addEllipse(in: sqare2)
 context?.addEllipse(in: sqare3)
 context?.fillPath()
 
 context?.setStrokeColor(UIColor.orange.cgColor)
 context?.setLineWidth(5)
 context?.setLineCap(CGLineCap.round)
 context?.move(to: CGPoint(x: sqare1.minX, y: sqare1.maxY))
 context?.addLine(to: CGPoint(x: sqare3.minX, y: sqare3.maxY))
 context?.strokePath()
 
 context?.setStrokeColor(UIColor.black.cgColor)
 context?.setLineWidth(5)
 context?.setLineCap(CGLineCap.square)
 context?.move(to: CGPoint(x: sqare3.maxX, y: sqare3.minY))
 context?.addLine(to: CGPoint(x: sqare1.maxX, y: sqare1.minY))
 context?.strokePath()
 
 context?.setStrokeColor(UIColor.yellow.cgColor)
 context?.setLineWidth(5)
 context?.setLineCap(CGLineCap.round)
 context?.move(to: CGPoint(x: sqare1.minX, y: sqare1.maxY))
 context?.addArc(center: CGPoint(x: sqare1.maxX, y: sqare1.maxY), radius: sqare1.width, startAngle: CGFloat.pi, endAngle: CGFloat.pi / 2, clockwise: true)
 context?.strokePath()
 
 context?.move(to: CGPoint(x: sqare3.maxX, y: sqare3.minY))
 context?.addArc(center: CGPoint(x: sqare3.minX, y: sqare3.minY), radius: sqare3.width, startAngle: 0, endAngle: CGFloat.pi * 3 / 2, clockwise: true)
 context?.strokePath()
 
 let text: NSString = "TEXT"
 let font = UIFont.systemFont(ofSize: 14)
 let shadow = NSShadow()
 shadow.shadowOffset = CGSize(width: 1, height: 1)
 shadow.shadowColor = UIColor.black
 shadow.shadowBlurRadius = 0.5
 let attributes = [NSAttributedString.Key.foregroundColor : UIColor.gray,
 NSAttributedString.Key.shadow : shadow,
 NSAttributedString.Key.font : font]
 
 let textSize = text.size(withAttributes: attributes)
 
 
 text.draw(at: CGPoint(x: sqare2.midX - textSize.width / 2, y: sqare2.midY - textSize.height / 2), withAttributes: attributes)
 //    text.draw(in: sqare2, withAttributes: attributes) */

// ----------------------------------------------



/*override func draw(_ rect: CGRect) {
    for _ in 1...50 {
        drawStar(rect)
    }
}

func randomColor() -> UIColor {
    let r = CGFloat(arc4random() % 256) / 255
    let g = CGFloat(arc4random() % 256) / 255
    let b = CGFloat(arc4random() % 256) / 255
    return UIColor(red: r, green: g, blue: b, alpha: 1)
}

func drawStar(_ rect: CGRect) {
    let offset = 150
    let sideOfStar = Int.random(in: offset / 10 ... offset / 2)
    
    let xStartPosition = Int.random(in: sideOfStar ... Int(rect.width) - sideOfStar)
    let yStartPosition = Int.random(in: 0 ... Int(rect.height) - sideOfStar * 3 / 2)
    
    let firstPoint  = CGPoint(x: xStartPosition, y: yStartPosition)
    let secondPoint = CGPoint(x: xStartPosition + sideOfStar * 4 / 5, y: yStartPosition + sideOfStar / 2)
    let thirdPoint  = CGPoint(x: xStartPosition + sideOfStar / 2, y: yStartPosition + sideOfStar * 3 / 2)
    let fourthPoint = CGPoint(x: xStartPosition - sideOfStar / 2, y: yStartPosition + sideOfStar * 3 / 2)
    let fifthPoint  = CGPoint(x: xStartPosition - sideOfStar * 4 / 5, y: yStartPosition + sideOfStar / 2)
    
    let invisibleSquareSide = CGFloat(sideOfStar / 3)
    
    let sqare1 = CGRect(x: firstPoint.x - invisibleSquareSide / 2,
                        y: firstPoint.y - invisibleSquareSide / 2,
                        width: invisibleSquareSide,
                        height: invisibleSquareSide)
    let sqare2 = CGRect(x: secondPoint.x - invisibleSquareSide / 2,
                        y: secondPoint.y - invisibleSquareSide / 2,
                        width: invisibleSquareSide,
                        height: invisibleSquareSide)
    let sqare3 = CGRect(x: thirdPoint.x - invisibleSquareSide / 2,
                        y: thirdPoint.y - invisibleSquareSide / 2,
                        width: invisibleSquareSide,
                        height: invisibleSquareSide)
    let sqare4 = CGRect(x: fourthPoint.x - invisibleSquareSide / 2,
                        y: fourthPoint.y - invisibleSquareSide / 2,
                        width: invisibleSquareSide,
                        height: invisibleSquareSide)
    let sqare5 = CGRect(x: fifthPoint.x - invisibleSquareSide / 2,
                        y: fifthPoint.y - invisibleSquareSide / 2,
                        width: invisibleSquareSide,
                        height: invisibleSquareSide)
    
    let context = UIGraphicsGetCurrentContext()
    let width = CGFloat.random(in: 3...5)
    let color = randomColor().cgColor
    
    context?.setFillColor(color)
    context?.setStrokeColor(color)
    context?.setLineCap(CGLineCap.round)
    context?.setLineWidth(width)
    
    context?.addLines(between: [firstPoint, thirdPoint, fifthPoint, secondPoint, fourthPoint])
    context?.fillPath()
    
    //  Теперь добавим окружности на концы звезды
    context?.setLineWidth(0)
    context?.addRect(sqare1)
    context?.addRect(sqare2)
    context?.addRect(sqare3)
    context?.addRect(sqare4)
    context?.addRect(sqare5)
    context?.strokePath()
    
    context?.setLineWidth(width)
    context?.addEllipse(in: sqare1)
    context?.addEllipse(in: sqare2)
    context?.addEllipse(in: sqare3)
    context?.addEllipse(in: sqare4)
    context?.addEllipse(in: sqare5)
    context?.strokePath()
    
    //  Соединим окружности
    context?.addLines(between: [firstPoint, secondPoint, thirdPoint, fourthPoint, fifthPoint, firstPoint])
    context?.strokePath()
    
    //  Закрасим
    context?.addLines(between: [firstPoint, thirdPoint, fifthPoint, secondPoint, fourthPoint])
    context?.fillPath(using: .winding)
    
}
*/
