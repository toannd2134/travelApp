//
//  headerCollectionReusableView.swift
//  TravelApp
//
//  Created by Toan on 7/14/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class headerCollectionReusableView: UICollectionReusableView {
    let headerview : UIView = {
        let view = UIView()
        
        view.layer.opacity = 1
        return view
    }()
    let expandLabel : UILabel = {
        let label  = UILabel()
        
        label.font  = UIFont(name: "Helvetica", size: 15)
        label.textColor = .darkGray
        return label
    }()
    let headerName : UILabel = {
        let label  = UILabel()
        label.font = UIFont.mainFont(font: .Helvetica, size: 20)
     
        return label
    }()
        override init(frame: CGRect) {
            super.init(frame : frame)
            self.sv(headerview)
            headerview.sv([headerName,expandLabel])
            layout()
            self.backgroundColor = .clear
        }
    func layout(){
        self.layout(
        0,
        |-0-headerview-0-|,0
        )
        
        headerview.layout(
        5,
        |-20-headerName-120-expandLabel-10-| ~ 20
        )
    }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
       
}
