//
//  GamePanel.swift
//  2048
//
//  Created by 潘博丰 on 2017/10/15.
//  Copyright © 2017年 潘博丰. All rights reserved.
//

import UIKit
class GamePanel: UIView{
    var diamondsNumber : Int = 0
    var diamondsSize : CGFloat = 0
    var diamondsPadding : CGFloat = 0
    var diamondsColor : UIColor = UIColor.orange
    
    func addPanel(diamondsNumber : Int, diamondsSize: CGFloat, diamondsPadding : CGFloat, backGroundColor : UIColor, foreGroundColor: UIColor){
        self.diamondsNumber = diamondsNumber
        self.diamondsSize = diamondsSize
        self.diamondsPadding = diamondsPadding
        let sizeOfGamePanel = diamondsPadding + CGFloat(diamondsNumber) * (diamondsSize + diamondsPadding)
        self.frame = CGRect(x:0, y:150, width:sizeOfGamePanel, height:sizeOfGamePanel)
        self.backgroundColor = backGroundColor
        self.diamondsColor = foreGroundColor
        addDiamonds(foreGroundColor: foreGroundColor)
    }
    
    func addDiamonds(foreGroundColor: UIColor){
        var locationX = diamondsPadding
        var locationY = diamondsPadding
        for _ in 0..<diamondsNumber{
            for _ in 0..<diamondsNumber{
                let dimondsFrame = UIView(frame : CGRect(x:locationX,y:locationY,width:diamondsSize,height:diamondsSize))
                dimondsFrame.backgroundColor = foreGroundColor
                dimondsFrame.layer.cornerRadius = 4
                addSubview(dimondsFrame)
                locationX = locationX + diamondsSize + diamondsPadding
            }
            locationX = diamondsPadding
            locationY = locationY + diamondsSize + diamondsPadding
        }
    }
    
     func insertDiamonds(positionX: CGFloat, positionY: CGFloat, value: Int){
        let insertX = diamondsPadding + positionX * (diamondsPadding + diamondsSize)
        let insertY = diamondsPadding + positionY * (diamondsPadding + diamondsSize)
        let diamondsView = DiamondsView(positionX: insertX, positionY: insertY, diamondsSize: diamondsSize, value: value)
        self.addSubview(diamondsView)
        self.bringSubview(toFront: diamondsView)
    }
    
    func removeAllSubView(){
        for i in self.subviews{
            i.removeFromSuperview()
        }
    }
}
