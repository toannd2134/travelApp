//
//  tourCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/29/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class topPropertiesColectionView: UICollectionViewCell {
    let montLabel : UILabel = {
        let label = UILabel()
        label.text = "1.500.000 VND"
        return label
    }()
    let  dateLabel  : UILabel = {
        let label = UILabel()
        label.text = "3 ngày,1 đêm/2 người"
        label.font = UIFont.mainFont(font: .Helvetica, size: 12)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sv([montLabel,dateLabel])
        self.layout(
        
        0,
        |-10-montLabel-50-dateLabel-10-|
        )
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
