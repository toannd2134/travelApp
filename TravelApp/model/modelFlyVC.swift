//
//  modelFlyVC.swift
//  TravelApp
//
//  Created by Toan on 7/18/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
struct  local {
    
    var name : String
    var imageLocal : UIImage!
    var decription : String?
}

struct totalData {
    var nameSection : String
    var local : [local]
}

func flyData()->[totalData]{
    var section1 = totalData(nameSection: "Dia diem pho bien", local: [
        local(name: "Rom", imageLocal: UIImage(named: "rom"), decription: nil),
        local(name: "Monaco", imageLocal: UIImage(named: "rom2"), decription: nil),
        local(name: "Rom", imageLocal: UIImage(named: "rom3"), decription: nil),
        
    ])
    var section2 = totalData(nameSection: "nhung dia diem hot", local: [
      local(name: "Tokyo", imageLocal: UIImage(named: "japan"), decription: "Bay ngay  den London voi gia thap nhat  la $119 neu ban dat ngay bay gio."),
      local(name: "Tokyo", imageLocal: UIImage(named: "japan"), decription: "Bay ngay  den London voi gia thap nhat  la $119 neu ban dat ngay bay gio.")
     
    
    ])
    var section3 = totalData(nameSection: "thanh pho dep nhat", local: [
     
    local(name: "Turkey", imageLocal: UIImage(named: "rom3"), decription: nil),
    local(name: "Monaco", imageLocal: UIImage(named: "mocaco2"), decription: nil),
    local(name: "Spain", imageLocal: UIImage(named: "monaco3"), decription: nil),
    ])
    return[section1,section2,section3]
    
    
}

