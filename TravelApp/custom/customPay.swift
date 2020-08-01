//
//  customPay.swift
//  TravelApp
//
//  Created by Toan on 8/1/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class customPay: UIView {
    
  let firstLabel = UILabel()
    let SecondLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sv([firstLabel,SecondLabel])
        self.layout(
        0,
        |-0-firstLabel-0-|,
        5,
        |-0-SecondLabel-0-|
        )
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
