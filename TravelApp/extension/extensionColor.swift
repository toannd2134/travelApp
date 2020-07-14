//
//  extensionColor.swift
//  TravelApp
//
//  Created by Toan on 7/12/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    class func  mainColor ()  ->UIColor {
        let color = UIColor(red: 0.17, green: 0.61, blue: 0.89, alpha: 1.00)
        return color
    }
    class func  backgroundColor() -> UIColor{
        let color = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00)
        return color
    }
    class func  backgroundTexFiled() -> UIColor{
           let color = UIColor(red: 1.00, green: 0.96, blue: 0.96, alpha: 1.00)
           return color
       }
}
