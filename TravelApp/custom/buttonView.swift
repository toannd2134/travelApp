//
//  buttonView.swift
//  TravelApp
//
//  Created by Toan on 7/27/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class buttonView: UIView {

    
    let imageIcon : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    let titileLabel : UILabel = {
       let label  = UILabel()
        label.textAlignment = .center   
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sv([imageIcon,titileLabel])
        self.layout(10,
                    |-10-imageIcon.centerHorizontally()-10-| ~ 20,
                    |-0-titileLabel.centerHorizontally()-0-|,
                    10
                    
                    )
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    

}
