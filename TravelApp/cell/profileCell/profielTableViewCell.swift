//
//  profielTableViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/24/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import  Stevia
class profielTableViewCell: UITableViewCell {
    let titlelabel : UILabel =  {
        let label = UILabel()
    
        return label
    }()
      
    let nextImage : UIImageView  = {
         let image = UIImageView()
        image.image = UIImage(named: "next")
        return image
    }()
    let choiceLabel : UILabel =  {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.mainFont(font: .Helvetica, size: 10)
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.sv([titlelabel,nextImage,choiceLabel])
               self.layout(
               0,
               |-10-titlelabel-100-choiceLabel-5-nextImage-10-|  ~ 20,10
               )
        // Configure the view for the selected state
    }

}
