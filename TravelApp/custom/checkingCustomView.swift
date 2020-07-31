

//
//  checkingCustomView.swift
//  TravelApp
//
//  Created by Toan on 7/28/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class checkingCustomView: UIView {
     
    let nameViewLabel : UILabel = {
        let label = UILabel()
        
        return label
    }()
    let textField : UITextField = {
        let  textField = UITextField()
        textField.boderTextField(color: .mainColor(), boderWidth: 1)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftView = view
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 10
        return textField
        
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sv([nameViewLabel,textField])
        self.layout(
            0,
            |-0-nameViewLabel-0-|,
            |-0-textField-0-| ~ 30,
            0
            )
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
