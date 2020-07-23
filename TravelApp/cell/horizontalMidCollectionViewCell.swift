//
//  horizontalMidCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/20/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class horizontalMidCollectionViewCell: UICollectionViewCell {
    let localImg : UIImageView  = {
       let img = UIImageView()
        
        
        return img
    }()
    let nameLabel : UILabel = {
         let label = UILabel()
        label.font = UIFont.mainFont(font: .Helvetica, size: 20)
        return label
    }()
    let priceLabel : UILabel = {
        let label = UILabel()
        label.text = "$11"
        label.font = UIFont.mainFont(font: .Helvetica, size: 15)
        return label
    }()
    let diriptionLabel : UILabel = {
           let label = UILabel()
        label.numberOfLines = 0
           label.font = UIFont.mainFont(font: .Helvetica, size: 15)
        label.textColor = .darkGray
           return label
       }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sv([localImg,nameLabel,priceLabel,diriptionLabel])
        layout()
    }
    
    func layout(){
        self.layout(
        0,
        |-0-localImg-220-| ~ 150
        
        )
        self.layout(
         20,
         |-140-nameLabel-priceLabel-| ~ 20 ,
         0,
         |-140-diriptionLabel-20-| ,
         0
        )
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}
