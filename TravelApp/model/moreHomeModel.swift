//
//  moreHomeModel.swift
//  TravelApp
//
//  Created by Toan on 7/27/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
struct MoreData {
    let bacimg : UIImage!
    let title : String
}
func moreData() -> [MoreData] {
    let image1 = MoreData(bacimg: UIImage(named: "more1"), title: "bể bơi thiên thần")
    let image2 = MoreData(bacimg: UIImage(named: "more2"), title: "tầm nhìn ra biển")
    let image3 = MoreData(bacimg: UIImage(named: "more3"), title: "Bể bơi bốn mùa")
    
    return [image1,image2,image3]
    
}
