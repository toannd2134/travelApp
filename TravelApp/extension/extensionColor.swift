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
    class func  headerColor() -> UIColor{
        let color = UIColor(red: 0.58, green: 0.52, blue: 0.52, alpha: 1.00)
        return color
    }
    class func textFiledBacground() -> UIColor{
           let color = UIColor(red: 0.16, green: 0.22, blue: 0.22, alpha: 1.00)
           return color
       }
   
    class func backgroundView() -> UIColor{
        let color =  UIColor(red: 0.21, green: 0.23, blue: 0.31, alpha: 1.00)
        return color
    }
}
