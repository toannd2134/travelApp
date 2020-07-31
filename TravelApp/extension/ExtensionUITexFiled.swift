//
//  ExtensionUITexFiled.swift
//  TravelApp
//
//  Created by Toan on 7/30/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit

extension UITextField {
    func boderTextField (color : UIColor , boderWidth : CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = boderWidth
    }
}
