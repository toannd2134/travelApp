//
//  modelProfile.swift
//  TravelApp
//
//  Created by Toan on 7/25/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import Foundation
struct ProfileDataCell  {
    let headerLabel : String
    let mainLabel :  String?
}
func ProfileData() ->[ProfileDataCell] {
    let section1 = ProfileDataCell(headerLabel: "Ngôn ngữ", mainLabel: "Tiếng việt")
    let section2 = ProfileDataCell(headerLabel: "Tiền tệ", mainLabel: "VND")
    let section3 = ProfileDataCell(headerLabel: "nhắc nhở", mainLabel: nil)
    let section4  = ProfileDataCell(headerLabel: "các đơn vị", mainLabel: "noi thanh")
    let section5  = ProfileDataCell(headerLabel: "chính sách bảo mật", mainLabel: nil)
    return [section1,section2,section3,section4,section5]
}

