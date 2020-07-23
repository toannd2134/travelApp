//
//  ReuseableCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/20/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class ReuseableCollectionViewCell: UICollectionViewCell {
    var  bacgroundImg = UIImageView ()
    let  nameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
        
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundView = bacgroundImg
        self.sv(nameLabel)
      
        self.layout(
        |-10-nameLabel-10-|,
        10
        )
        self.backgroundColor = .clear
        
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
