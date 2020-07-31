//
//  headerPropertiesCollectionReusableView.swift
//  TravelApp
//
//  Created by Toan on 7/27/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class headerPropertiesCollectionReusableView: UICollectionReusableView {
    
    let backgroundImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bacgroundheader")
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sv(backgroundImage)
        self.layout(0,
                    |-0-backgroundImage-0-|,0)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
