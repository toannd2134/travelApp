//
//  MoreCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/27/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class MoreCollectionViewCell: UICollectionViewCell {
    let starRateImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "rate")
        return img
    }()
    let bacgroundImgae : UIImageView  = {
       let img = UIImageView()
        return img
    }()
     let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.sv([bacgroundImgae,titleLabel])
        self.layout(0,
                   |-0-bacgroundImgae-0-|,
                   
                   |-10-titleLabel-0-|,0
                   )
        bacgroundImgae.sv(starRateImage)
        bacgroundImgae.layout(
            150,
            |-10-starRateImage-100-|,
            10
        )
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
