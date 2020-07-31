//
//  MidPropertiesCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/27/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class MidPropertiesCollectionViewCell: UICollectionViewCell {
    
    let rateView  : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.98, green: 0.68, blue: 0.20, alpha: 1.00)
        view.layer.cornerRadius = 10
        return view
    }()
    let mainView  : UIView  = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let goodLabel : UILabel  = {
        let label = UILabel()
        label.text = "rất tốt"
        return label
    }()
    let rateLabel : UILabel  = {
        let label = UILabel()
        label.text = "4.5"
        label.textColor = .white
        return label
    }()
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sv([mainView])
       self.layout(
        0,
        |-0-mainView-0-|,
        1
        )
        mainView.sv([rateView,goodLabel])
        mainView.layout(
        10,
        |-0-rateView-10-goodLabel-220-| ~ 35 ,
        10
        )
        rateView.sv(rateLabel)
        rateView.layout(
        0,
        |-10-rateLabel.centerVertically()-10-|
        )
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
