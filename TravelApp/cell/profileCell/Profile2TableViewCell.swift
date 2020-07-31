//
//  Profile2TableViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/25/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class Profile2TableViewCell: UITableViewCell {
    let toogleSwicth : UISwitch  = {
        let toogleswitch = UISwitch()
        return toogleswitch
    }()
    let titlelabel : UILabel =  {
        let label = UILabel()
    
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.sv([titlelabel,toogleSwicth])
                      self.layout(
                      0,
                      |-10-titlelabel-150-toogleSwicth-10-|  ~ 20,
                     10
                      )
        // Configure the view for the selected state
    }

}
