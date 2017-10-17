//
//  GameModel.swift
//  2048
//
//  Created by 潘博丰 on 2017/10/16.
//  Copyright © 2017年 潘博丰. All rights reserved.
//

import Foundation
class GameModel {
    var diamondsLineOne:[Int] = [0,0,0,0]
    var diamondsLineTwo:[Int] = [0,0,0,0]
    var diamondsLineThree:[Int] = [0,0,0,0]
    var diamondsLineFour:[Int] = [0,0,0,0]
    var diamondsRowOne:[Int] = [0,0,0,0]
    var diamondsRowTwo:[Int] = [0,0,0,0]
    var diamondsRowThree:[Int] = [0,0,0,0]
    var diamondsRowFour:[Int] = [0,0,0,0]
    let theFirstDiamondX: Int
    let theFirstDiamondY: Int
    var theSecondDiamondX: Int
    var theSecondDiamondY: Int
    var createRandomX: Int = 0
    var createRandomY: Int = 0
    
    init(){
        self.theFirstDiamondX = Int(arc4random() % 4)
        self.theFirstDiamondY = Int(arc4random() % 4)
        repeat{
            self.theSecondDiamondX = Int(arc4random() % 4)
            self.theSecondDiamondY = Int(arc4random() % 4)
        } while self.theSecondDiamondX == self.theFirstDiamondX && self.theSecondDiamondY == self.theSecondDiamondY
        let _ = insertToArray(positionX: theFirstDiamondX, positionY: theFirstDiamondY, value: 2)
        let _ = insertToArray(positionX: theSecondDiamondX, positionY: theSecondDiamondY, value: 2)
    }
    
    func insertToArray(positionX: Int, positionY: Int, value: Int) -> Bool{
        switch positionY{
        case 0:
            if(diamondsLineOne[positionX] == 0){
                diamondsLineOne[positionX] = value
                return true
            }
            else { return false }
        case 1:
            if(diamondsLineTwo[positionX] == 0){
                diamondsLineTwo[positionX] = value
                return true
            }
            else { return false }
        case 2:
            if(diamondsLineThree[positionX] == 0){
                diamondsLineThree[positionX] = value
                return true
            }
            else { return false }
        case 3:
            if(diamondsLineFour[positionX] == 0){
                diamondsLineFour[positionX] = value
                return true
            }
            else { return false }
        default:
            break
        }
        return false
    }
    
    func userIsSliding(_ direction: Int){
        switch direction{
        case 0:
            slideUp()
        case 1:
            slideDown()
        case 2:
            slideLeft()
        case 3:
            slideRight()
        default:
            break
        }
        var isOrNotSuccess:Bool
        repeat {
           self.createRandomX = Int(arc4random() % 4)
           self.createRandomY = Int(arc4random() % 4)
           isOrNotSuccess = insertToArray(positionX: self.createRandomX, positionY: self.createRandomY, value: 2)
        } while isOrNotSuccess == false
    }
    
    func slideUp(){
        resertArray()
        zeroKillUp()
        for i in 0..<3{
            if diamondsRowOne[i] == diamondsRowOne[i+1]{
                diamondsRowOne[i] = diamondsRowOne[i] * 2
                diamondsRowOne[i+1] = 0
            }
        }
        for i in 0..<3{
            if diamondsRowTwo[i] == diamondsRowTwo[i+1]{
                diamondsRowTwo[i] = diamondsRowTwo[i] * 2
                diamondsRowTwo[i+1] = 0
            }
        }
        for i in 0..<3{
            if diamondsRowThree[i] == diamondsRowThree[i+1]{
                diamondsRowThree[i] = diamondsRowThree[i] * 2
                diamondsRowThree[i+1] = 0
            }
        }
        for i in 0..<3{
            if diamondsRowFour[i] == diamondsRowFour[i+1]{
                diamondsRowFour[i] = diamondsRowFour[i] * 2
                diamondsRowFour[i+1] = 0
            }
        }
        zeroKillUp()
        reserveArray()
    }
    
    func slideDown(){
        resertArray()
        zeroKillDown()
        for i in 0..<3{
            if diamondsRowOne[3-i] == diamondsRowOne[3-i-1]{
                diamondsRowOne[3-i] = diamondsRowOne[3-i] * 2
                diamondsRowOne[3-i-1] = 0
            }
        }
        for i in 0..<3{
            if diamondsRowTwo[3-i] == diamondsRowTwo[3-i-1]{
                diamondsRowTwo[3-i] = diamondsRowTwo[3-i] * 2
                diamondsRowTwo[3-i-1] = 0
            }
        }
        for i in 0..<3{
            if diamondsRowThree[3-i] == diamondsRowThree[3-i-1]{
                diamondsRowThree[3-i] = diamondsRowThree[3-i] * 2
                diamondsRowThree[3-i-1] = 0
            }
        }
        for i in 0..<3{
            if diamondsRowFour[3-i] == diamondsRowFour[3-i-1]{
                diamondsRowFour[3-i] = diamondsRowFour[3-i] * 2
                diamondsRowFour[3-i-1] = 0
            }
        }
        zeroKillDown()
        reserveArray()
    }
    
    func slideLeft(){
        zeroKillLeft()
        for i in 0..<3{
            if diamondsLineOne[i] == diamondsLineOne[i+1]{
                diamondsLineOne[i] = diamondsLineOne[i] * 2
                diamondsLineOne[i+1] = 0
            }
        }
        for i in 0..<3{
            if diamondsLineTwo[i] == diamondsLineTwo[i+1]{
                diamondsLineTwo[i] = diamondsLineTwo[i] * 2
                diamondsLineTwo[i+1] = 0
            }
        }
        for i in 0..<3{
            if diamondsLineThree[i] == diamondsLineThree[i+1]{
                diamondsLineThree[i] = diamondsLineThree[i] * 2
                diamondsLineThree[i+1] = 0
            }
        }
        for i in 0..<3{
            if diamondsLineFour[i] == diamondsLineFour[i+1]{
                diamondsLineFour[i] = diamondsLineFour[i] * 2
                diamondsLineFour[i+1] = 0
            }
        }
        zeroKillLeft()
    }
    
    func slideRight(){
        zeroKillRight()
        for i in 0..<3{
            if diamondsLineOne[3-i] == diamondsLineOne[3-i-1]{
                diamondsLineOne[3-i] = diamondsLineOne[3-i] * 2
                diamondsLineOne[3-i-1] = 0
            }
        }
        for i in 0..<3{
            if diamondsLineTwo[3-i] == diamondsLineTwo[3-i-1]{
                diamondsLineTwo[3-i] = diamondsLineTwo[3-i] * 2
                diamondsLineTwo[3-i-1] = 0
            }
        }
        for i in 0..<3{
            if diamondsLineThree[3-i] == diamondsLineThree[3-i-1]{
                diamondsLineThree[3-i] = diamondsLineThree[3-i] * 2
                diamondsLineThree[3-i-1] = 0
            }
        }
        for i in 0..<3{
            if diamondsLineFour[3-i] == diamondsLineFour[3-i-1]{
                diamondsLineFour[3-i] = diamondsLineFour[3-i] * 2
                diamondsLineFour[3-i-1] = 0
            }
        }
        zeroKillRight()
    }
    
    func zeroKillRight(){
        var i = 3
        for j in (3-i)..<4{
            if diamondsLineOne[3-j] != 0{
                diamondsLineOne[i] = diamondsLineOne[3-j]
                i = i-1
            }
        }
        for j in 0..<i+1{
            diamondsLineOne[j] = 0
        }
        i = 3
        for j in (3-i)..<4{
            if diamondsLineTwo[3-j] != 0{
                diamondsLineTwo[i] = diamondsLineTwo[3-j]
                i = i-1
            }
        }
        for j in 0..<i+1{
            diamondsLineTwo[j] = 0
        }
        i = 3
        for j in (3-i)..<4{
            if diamondsLineThree[3-j] != 0{
                diamondsLineThree[i] = diamondsLineThree[3-j]
                i = i-1
            }
        }
        for j in 0..<i+1{
            diamondsLineThree[j] = 0
        }
        i = 3
        for j in (3-i)..<4{
            if diamondsLineFour[3-j] != 0{
                diamondsLineFour[i] = diamondsLineFour[3-j]
                i = i-1
            }
        }
        for j in 0..<i+1{
            diamondsLineFour[j] = 0
        }
    }
    
    func zeroKillDown(){
        var i = 3
        for j in (3-i)..<4{
            if diamondsRowOne[3-j] != 0{
                diamondsRowOne[i] = diamondsRowOne[3-j]
                i = i-1
            }
        }
        for j in 0..<i+1{
            diamondsRowOne[j] = 0
        }
        i = 3
        for j in (3-i)..<4{
            if diamondsRowTwo[3-j] != 0{
                diamondsRowTwo[i] = diamondsRowTwo[3-j]
                i = i-1
            }
        }
        for j in 0..<i+1{
            diamondsRowTwo[j] = 0
        }
        i = 3
        for j in (3-i)..<4{
            if diamondsRowThree[3-j] != 0{
                diamondsRowThree[i] = diamondsRowThree[3-j]
                i = i-1
            }
        }
        for j in 0..<i+1{
            diamondsRowThree[j] = 0
        }
        i = 3
        for j in (3-i)..<4{
            if diamondsRowFour[3-j] != 0{
                diamondsRowFour[i] = diamondsRowFour[3-j]
                i = i-1
            }
        }
        for j in 0..<i+1{
            diamondsRowFour[j] = 0
        }
    }
    
    func zeroKillUp(){
        var i = 0
        for j in 0..<4{
            if diamondsRowOne[j] != 0{
                diamondsRowOne[i] = diamondsRowOne[j]
                i = i+1
            }
        }
        for j in i..<4{
            diamondsRowOne[j] = 0
        }
        i = 0
        for j in 0..<4{
            if diamondsRowTwo[j] != 0{
                diamondsRowTwo[i] = diamondsRowTwo[j]
                i = i+1
            }
        }
        for j in i..<4{
            diamondsRowTwo[j] = 0
        }
        i = 0
        for j in 0..<4{
            if diamondsRowThree[j] != 0{
                diamondsRowThree[i] = diamondsRowThree[j]
                i = i+1
            }
        }
        for j in i..<4{
            diamondsRowThree[j] = 0
        }
        i = 0
        for j in 0..<4{
            if diamondsRowFour[j] != 0{
                diamondsRowFour[i] = diamondsRowFour[j]
                i = i+1
            }
        }
        for j in i..<4{
            diamondsRowFour[j] = 0
        }
    }
    
    func zeroKillLeft(){
        var i = 0
        for j in 0..<4{
            if diamondsLineOne[j] != 0{
                diamondsLineOne[i] = diamondsLineOne[j]
                i = i+1
            }
        }
        for j in i..<4{
            diamondsLineOne[j] = 0
        }
        i = 0
        for j in 0..<4{
            if diamondsLineTwo[j] != 0{
                diamondsLineTwo[i] = diamondsLineTwo[j]
                i = i+1
            }
        }
        for j in i..<4{
            diamondsLineTwo[j] = 0
        }
        i = 0
        for j in 0..<4{
            if diamondsLineThree[j] != 0{
                diamondsLineThree[i] = diamondsLineThree[j]
                i = i+1
            }
        }
        for j in i..<4{
            diamondsLineThree[j] = 0
        }
        i = 0
        for j in 0..<4{
            if diamondsLineFour[j] != 0{
                diamondsLineFour[i] = diamondsLineFour[j]
                i = i+1
            }
        }
        for j in i..<4{
            diamondsLineFour[j] = 0
        }
    }
    
    func resertArray(){
        diamondsRowOne[0] = diamondsLineOne[0]
        diamondsRowOne[1] = diamondsLineTwo[0]
        diamondsRowOne[2] = diamondsLineThree[0]
        diamondsRowOne[3] = diamondsLineFour[0]
        diamondsRowTwo[0] = diamondsLineOne[1]
        diamondsRowTwo[1] = diamondsLineTwo[1]
        diamondsRowTwo[2] = diamondsLineThree[1]
        diamondsRowTwo[3] = diamondsLineFour[1]
        diamondsRowThree[0] = diamondsLineOne[2]
        diamondsRowThree[1] = diamondsLineTwo[2]
        diamondsRowThree[2] = diamondsLineThree[2]
        diamondsRowThree[3] = diamondsLineFour[2]
        diamondsRowFour[0] = diamondsLineOne[3]
        diamondsRowFour[1] = diamondsLineTwo[3]
        diamondsRowFour[2] = diamondsLineThree[3]
        diamondsRowFour[3] = diamondsLineFour[3]
    }
    
    func reserveArray(){
        diamondsLineOne[0] = diamondsRowOne[0]
        diamondsLineTwo[0] = diamondsRowOne[1]
        diamondsLineThree[0] = diamondsRowOne[2]
        diamondsLineFour[0] = diamondsRowOne[3]
        diamondsLineOne[1] = diamondsRowTwo[0]
        diamondsLineTwo[1] = diamondsRowTwo[1]
        diamondsLineThree[1] = diamondsRowTwo[2]
        diamondsLineFour[1] = diamondsRowTwo[3]
        diamondsLineOne[2] = diamondsRowThree[0]
        diamondsLineTwo[2] = diamondsRowThree[1]
        diamondsLineThree[2] = diamondsRowThree[2]
        diamondsLineFour[2] = diamondsRowThree[3]
        diamondsLineOne[3] = diamondsRowFour[0]
        diamondsLineTwo[3] = diamondsRowFour[1]
        diamondsLineThree[3] = diamondsRowFour[2]
        diamondsLineFour[3] = diamondsRowFour[3]
    }
    
    func isGameOver() -> Bool{
        var flagEqual = 0
        var flagZero = 0
        for i in 0..<3{
            if(diamondsLineOne[i] == diamondsLineOne[i+1]) {flagEqual=1}
            if(diamondsLineOne[i] == 0){flagZero = 1}
            if(diamondsLineOne[i+1] == 0){flagZero = 1}
        }
        for i in 0..<3{
            if(diamondsLineTwo[i] == diamondsLineTwo[i+1]) {flagEqual=1}
            if(diamondsLineTwo[i] == 0){flagZero = 1}
            if(diamondsLineTwo[i+1] == 0){flagZero = 1}
        }
        for i in 0..<3{
            if(diamondsLineThree[i] == diamondsLineThree[i+1]) {flagEqual=1}
            if(diamondsLineThree[i] == 0){flagZero = 1}
            if(diamondsLineThree[i+1] == 0){flagZero = 1}
        }
        for i in 0..<3{
            if(diamondsLineFour[i] == diamondsLineFour[i+1]) {flagEqual=1}
            if(diamondsLineFour[i] == 0){flagZero = 1}
            if(diamondsLineFour[i+1] == 0){flagZero = 1}
        }
        resertArray()
        for i in 0..<3{
            if(diamondsRowOne[i] == diamondsRowOne[i+1]) {flagEqual=1} }
        for i in 0..<3{
            if(diamondsRowTwo[i] == diamondsRowTwo[i+1]) {flagEqual=1} }
        for i in 0..<3{
            if(diamondsLRowThree[i] == diamondsLineThree[i+1]) {flagEqual=1} }
        for i in 0..<3{
            if(diamondsRowFour[i] == diamondsRowFour[i+1]) {flagEqual=1} }
        if flagEqual == 1 || flagZero == 1 {return false}
        else {return true}
    }
}
