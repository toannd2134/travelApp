//
//  ExtensionFont.swift
//  TravelApp
//
//  Created by Toan on 7/13/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import Foundation
import UIKit
extension UIFont {
    
    enum fontChoice {
        case Thonburi
        case  Helvetica
      
    }
     class func  mainFont(font : fontChoice, size : CGFloat) -> UIFont {
        switch font {
        case .Thonburi:
            return UIFont(name:  "Thonburi", size: size)!
        default:
            return UIFont(name:  "Helvetica", size: size)!
        }
    }
}

