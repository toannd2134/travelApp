
//
//  TopHotelPropertiesCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 8/1/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class TopHotelPropertiesCollectionViewCell: UICollectionViewCell {
    var bacImg = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.sv(bacImg)
        self.layout(0,|-0-bacImg-0-|,0)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
