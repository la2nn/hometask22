//
//  ViewController.swift
//  HW22Touches
//
//  Created by Nick on 23.05.2019.
//  Copyright © 2019 nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var chessBoard: UIView!
    var draggingChecker: UIView!
    var oldCenterOfChecker: CGPoint!
    var oldCellOfChecker: ChessboardCellView!
    var insidePartOfBoard: UIView!
    var isRedTurnNow = true
    
    var sizeOfCell: CGFloat = 0
    var sizeOfChecker: CGFloat = 0
    
    var cells = [ChessboardCellView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sizeOfCell = view.frame.maxX / 9.6               
        sizeOfChecker = view.frame.maxX / 15.36
        let offset: CGFloat = view.frame.maxX / 24
        
        chessBoard = UIView(frame: CGRect(x: offset, y: self.view.frame.midY, width: view.frame.maxX - offset * 2, height: view.frame.maxX - offset * 2))
        chessBoard.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        chessBoard.backgroundColor = .brown
        chessBoard.autoresizingMask = [ .flexibleTopMargin, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin]
        view.addSubview(chessBoard)
        
        insidePartOfBoard = UIView(frame: CGRect(x: offset , y: offset, width: view.frame.maxX - offset * 4, height: view.frame.maxX - offset * 4))
        insidePartOfBoard.backgroundColor = #colorLiteral(red: 0.9929032922, green: 0.9732465148, blue: 0.9930025935, alpha: 1)
        insidePartOfBoard.autoresizingMask = [.flexibleWidth, .flexibleTopMargin, .flexibleBottomMargin, .flexibleLeftMargin]
        chessBoard.addSubview(insidePartOfBoard)
        
        for i in 1...8 {
            for j in 1...8 {
                if i % 2 == j % 2 {
                    let cell = ChessboardCellView(frame: CGRect(x: sizeOfCell * CGFloat(j) - sizeOfCell,
                                                                y: 8 * sizeOfCell - CGFloat(i) * sizeOfCell,
                                                                width: sizeOfCell,
                                                                height: sizeOfCell))
                    cell.backgroundColor = .black
                    insidePartOfBoard.addSubview(cell)
                    cells.append(cell)
                    
                    if (1...3) ~= i {
                        let redChecker = UIView(frame: CGRect(x: 0, y: 0, width: sizeOfChecker, height: sizeOfChecker))
                        redChecker.layer.cornerRadius = CGFloat(sizeOfChecker / 2)
                        redChecker.backgroundColor = .red
                        redChecker.center = cell.center
                        insidePartOfBoard.addSubview(redChecker)
                        cell.isVacant = false
                    }
                    
                    if (6...8) ~= i {
                        let whiteChecker = UIView(frame: CGRect(x: 0, y: 0, width: sizeOfChecker, height: sizeOfChecker))
                        whiteChecker.layer.cornerRadius = CGFloat(sizeOfChecker / 2)
                        whiteChecker.backgroundColor = .white
                        whiteChecker.center = cell.center
                        insidePartOfBoard.addSubview(whiteChecker)
                        cell.isVacant = false
                    }

                }
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)  {
        let touch = touches.first
        let pointInsideChessboard = touch!.location(in: insidePartOfBoard)
        let currentCheckerView = insidePartOfBoard.hitTest(pointInsideChessboard, with: event)
        
        if (isRedTurnNow && currentCheckerView?.backgroundColor == .red) || (!isRedTurnNow && currentCheckerView?.backgroundColor == .white)  {
            draggingChecker = currentCheckerView
            oldCenterOfChecker = draggingChecker.center
            insidePartOfBoard.bringSubviewToFront(draggingChecker)
 
            oldCellOfChecker = insidePartOfBoard.hitTest(CGPoint(x: oldCenterOfChecker!.x - sizeOfCell / 2 + 1,
                                                                 y: oldCenterOfChecker!.y), with: event) as! ChessboardCellView
            UIView.animate(withDuration: 0.3,
                           animations: {
                            self.draggingChecker.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                            self.draggingChecker.alpha = 0.7
                            })
        }
    }
    
     override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)  {
        if draggingChecker != nil {
            let touch = touches.first
            let pointInsideChessboard = touch!.location(in: insidePartOfBoard)
            draggingChecker.center = pointInsideChessboard
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)  {
        endOfMoving(event: event)
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)  {
        endOfMoving(event: event)
    }
    
    func endOfMoving(event: UIEvent?) {
        
        if draggingChecker != nil {
            var minimumDistance: CGFloat = 4096
            var cellToMove: ChessboardCellView!
            
            for cell in cells {
                let tempDistance = sqrt(pow((draggingChecker.center.x - cell.center.x), 2) +
                                        pow((draggingChecker.center.y - cell.center.y), 2))
                
                if minimumDistance >= tempDistance {
                    minimumDistance = tempDistance
                    cellToMove = cell
                }
            }
            
            if cellToMove.isVacant {
                draggingChecker.center = cellToMove.center
                
                for cell in cells {
                    if cellToMove.isEqual(cell) { cell.isVacant = false }
                    if oldCellOfChecker.isEqual(cell) { cell.isVacant = true }
                }
                isRedTurnNow = !isRedTurnNow
            } else {
                draggingChecker.center = oldCenterOfChecker
            }
           
            UIView.animate(withDuration: 0.3,
                           animations: {
                            self.draggingChecker.transform = CGAffineTransform.identity
                            self.draggingChecker.alpha = 1
            })
        }
        
        draggingChecker = nil
    }

}
