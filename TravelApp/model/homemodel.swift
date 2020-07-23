//
//  modelCollection.swift
//  TravelApp
//
//  Created by Toan on 7/14/20.
//  Copyright © 2020 Toan. All rights reserved.
//


import UIKit

struct tour {
    var bacgroundImage : UIImage!
    var nameLocation : String
    var decribe :String
    var rate : Float
    var value : Int
    
    
}
func Data()->[tour]{
    let data1 = tour(bacgroundImage: UIImage(named: "travel"), nameLocation: "Calmel,California", decribe: "USA'S mos romatic destination", rate: 4.5, value: 256)
    let data2 = tour(bacgroundImage: UIImage(named: "travel2"), nameLocation: "Calmel,California", decribe: "USA'S mos romatic destination", rate: 4.5, value: 256)

    
    return[data1,data2]
}
