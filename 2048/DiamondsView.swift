//
//  diamondsView.swift
//  2048
//
//  Created by 潘博丰 on 2017/10/15.
//  Copyright © 2017年 潘博丰. All rights reserved.
//

import UIKit
class DiamondsView: UIView{
    var diamondsLabel: UILabel
    var diamondsValue = 0
    
    init(positionX: CGFloat, positionY: CGFloat, diamondsSize: CGFloat, value: Int){
        diamondsLabel = UILabel(frame : CGRect(x:0,y:0,width:diamondsSize,height:diamondsSize))
        diamondsLabel.textAlignment = NSTextAlignment.center
        diamondsLabel.textColor = UIColor(red : 0xE2/255, green : 0xE4/255, blue : 0xE3/255, alpha : 1)
        diamondsLabel.font = UIFont(name: "HelveticaNeue", size: 40.0)
        super.init(frame: CGRect(x:positionX,y:positionY,width:diamondsSize,height:diamondsSize))
        addSubview(diamondsLabel)
        diamondsLabel.layer.cornerRadius = 4
        self.diamondsValue = value
        diamondsLabel.text = "\(diamondsValue)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


