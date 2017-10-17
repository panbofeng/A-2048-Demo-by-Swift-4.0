//
//  ViewController.swift
//  2048
//
//  Created by 潘博丰 on 2017/10/14.
//  Copyright © 2017年 潘博丰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelPosition: UILabel!
    var diamondsNumber: Int = 4
    var diamondsPadding: CGFloat = 5
    var diamondsSize: CGFloat = 0
    var gameModel = GameModel()
    var gamePanel = GamePanel()

    override func viewDidLoad() {
        super.viewDidLoad()
        addGamePanel(firstPositionX: gameModel.theFirstDiamondX, firstPositionY: gameModel.theFirstDiamondY, secondPositionX: gameModel.theSecondDiamondX, secondPositionY: gameModel.theSecondDiamondY)
    }
    
    @IBAction func userSlideUp(_ sender: UISwipeGestureRecognizer) {
        gameModel.userIsSliding(0)
        rebuildGamePanel()
    }
    
    @IBAction func userSlideDown(_ sender: UISwipeGestureRecognizer) {
        gameModel.userIsSliding(1)
        rebuildGamePanel()
    }
    
    @IBAction func userSlideLeft(_ sender: UISwipeGestureRecognizer) {
        gameModel.userIsSliding(2)
        rebuildGamePanel()
    }
    @IBAction func userSlideRight(_ sender: UISwipeGestureRecognizer) {
        gameModel.userIsSliding(3)
        rebuildGamePanel()
    }
    
    func addGamePanel(firstPositionX: Int, firstPositionY: Int, secondPositionX: Int, secondPositionY: Int){
        self.diamondsSize = (view.bounds.size.width - ((CGFloat(diamondsNumber) + CGFloat(1)) * diamondsPadding)) / CGFloat(diamondsNumber)
        gamePanel.addPanel(
            diamondsNumber : self.diamondsNumber,
            diamondsSize: diamondsSize,
            diamondsPadding: self.diamondsPadding,
            backGroundColor:  UIColor(red : 0x30/255, green : 0x32/255, blue : 0x38/255, alpha : 1),
            foreGroundColor : UIColor(red : 0xAC/255, green : 0xDA/255, blue : 0xEA/255, alpha : 0.5)
        )
        view.addSubview(gamePanel)
        if(firstPositionX != -1){
            gamePanel.insertDiamonds(positionX: CGFloat(firstPositionX), positionY: CGFloat(firstPositionY), value: 2)
            gamePanel.insertDiamonds(positionX: CGFloat(secondPositionX), positionY: CGFloat(secondPositionY), value: 2)
            let _ = gameModel.insertToArray(positionX: firstPositionX, positionY: firstPositionY, value: 2)
            let _ = gameModel.insertToArray(positionX: secondPositionX, positionY: secondPositionY, value: 2)
        }
    }
    
    func rebuildGamePanel()
    {
        gamePanel.removeAllSubView()
        gamePanel.removeFromSuperview()
        addGamePanel(firstPositionX: -1, firstPositionY: -1, secondPositionX: -1, secondPositionY: -1)
        for i in 0..<4{
            if(gameModel.diamondsLineOne[i] != 0){
                gamePanel.insertDiamonds(positionX: CGFloat(i), positionY: 0, value: gameModel.diamondsLineOne[i])
                let _ = gameModel.insertToArray(positionX: i, positionY: 0, value: gameModel.diamondsLineOne[i])
            }
        }
        for i in 0..<4{
            if(gameModel.diamondsLineTwo[i] != 0){
                gamePanel.insertDiamonds(positionX: CGFloat(i), positionY: 1, value: gameModel.diamondsLineTwo[i])
                let _ = gameModel.insertToArray(positionX: i, positionY: 1, value: gameModel.diamondsLineOne[i])
            }
        }
        for i in 0..<4{
            if(gameModel.diamondsLineThree[i] != 0){
                gamePanel.insertDiamonds(positionX: CGFloat(i), positionY: 2, value: gameModel.diamondsLineThree[i])
                let _ = gameModel.insertToArray(positionX: i, positionY: 2, value: gameModel.diamondsLineOne[i])
            }
        }
        for i in 0..<4{
            if(gameModel.diamondsLineFour[i] != 0){
                gamePanel.insertDiamonds(positionX: CGFloat(i), positionY: 3, value: gameModel.diamondsLineFour[i])
                let _ = gameModel.insertToArray(positionX: i, positionY: 3, value: gameModel.diamondsLineOne[i])
            }
        }
        labelPosition.text = "\(Int(labelPosition.text!)!+10)"
        gamePanel.insertDiamonds(positionX: CGFloat(gameModel.createRandomX), positionY: CGFloat(gameModel.createRandomY), value: 2)
    }
}
