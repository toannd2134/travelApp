//
//  tourInsideCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/15/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class tourInsideCollectionViewCell: UICollectionViewCell {
    
    let rateImage  : UIImageView  = {
        let imageview = UIImageView ()
        imageview.image = UIImage(named: "rate")
        return imageview
    }()
    let nameLable  : UILabel =  {
       let label = UILabel()
        label.textColor = .white
        return label
    }()
    let dicriptionLabel  : UILabel =  {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.mainFont(font: .Helvetica, size: 12)
        label.numberOfLines = 0
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sv([rateImage,nameLable,dicriptionLabel])
        self.layout(
        260,
       |-20-rateImage-230-| ,20
        
        )
        self.layout(
        260,
        |-100-nameLable-20-|,
        0,
        |-100-dicriptionLabel-20-|,20
        )
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
