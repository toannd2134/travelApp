//
//  modelHotelVC.swift
//  TravelApp
//
//  Created by Toan on 7/22/20.
//  Copyright © 2020 Toan. All rights reserved.
//


import UIKit




struct  hotel {
    
    var name : String
    var imageLocal : UIImage!
    var decription : String?
}

struct  datahotel {
    var nameSection : String
    var local : [local]
}

func hotelData()->[totalData]{
    var section1 = totalData(nameSection: "Gan ban", local: [
        local(name: "plaza", imageLocal: UIImage(named: "plaza"), decription: nil),
        local(name: "Royal hotel", imageLocal: UIImage(named: "rom2"), decription: nil),
        local(name: "Rom hotel", imageLocal: UIImage(named: "rom3"), decription: nil),
        
    ])
    var section2 = totalData(nameSection: "Goi y", local: [
      local(name: "Tokyo", imageLocal: UIImage(named: "japan"), decription: "Bay ngay  den London voi gia thap nhat  la $119 neu ban dat ngay bay gio."),
      local(name: "Tokyo", imageLocal: UIImage(named: "japan"), decription: "Bay ngay  den London voi gia thap nhat  la $119 neu ban dat ngay bay gio.")
     
    
    ])
    var section3 = totalData(nameSection: "Best hotel", local: [
     
    local(name: "Ambassdor", imageLocal: UIImage(named: "hotel2"), decription: nil),
    local(name: "ryby hotel", imageLocal: UIImage(named: "royal"), decription: nil),
    
    ])
    return[section1,section2,section3]
    
    
}
