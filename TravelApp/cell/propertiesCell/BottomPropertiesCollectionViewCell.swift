
//
//  BottomPropertiesCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/27/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia

class BottomPropertiesCollectionViewCell: UICollectionViewCell {
    
    let CheckButton :  UIButton = {
       let button = UIButton()
        button.setTitle("Đặt ngay", for: .normal)
        button.backgroundColor = .mainColor()
        button.layer.cornerRadius = 20
        button.clipsToBounds  = true
        button.addTarget(self, action: #selector(checPush), for: .touchUpInside)
        return button
    }()
    let wifiView  : buttonView = {
        let view = buttonView()
        view.imageIcon.image = UIImage(named: "wifi")
        view.titileLabel.text = "wifi "
        view.titileLabel.font = UIFont.mainFont(font: .Helvetica, size: 10)
        return view
    }()
    let eatView  : buttonView = {
          let view = buttonView()
          view.imageIcon.image = UIImage(named: "cup")
          view.titileLabel.text = "ăn uống "
        view.titileLabel.font = UIFont.mainFont(font: .Helvetica, size: 10)
          return view
      }()
    let dogView  : buttonView = {
          let view = buttonView()
          view.imageIcon.image = UIImage(named: "dog")
          view.titileLabel.text = "animal"
        view.titileLabel.font = UIFont.mainFont(font: .Helvetica, size: 10)
          return view
      }()
    let tvView  : buttonView = {
          let view = buttonView()
          view.imageIcon.image = UIImage(named: "tv")
          view.titileLabel.text = "TV"
        view.titileLabel.font = UIFont.mainFont(font: .Helvetica, size: 10)
          return view
      }()
    let swimView  : buttonView = {
          let view = buttonView()
          view.imageIcon.image = UIImage(named: "swim")
          view.titileLabel.text = "bể bơi"
        view.titileLabel.font = UIFont.mainFont(font: .Helvetica, size: 10)
          return view
      }()
    var pushCV : (()-> Void)?
       
    let stack = UIStackView()
    let headerCommetLabel : UILabel = {
       let label = UILabel()
        label.text = "Nice View"
        return label
    }()
    let commentLabel : UILabel = {
       let label = UILabel()
        label.text = "In case you are still not sure why anyone would want to build their own mobile platform, here are the top seven benefits of going down this path sooner rather than later"
        label.numberOfLines = 0
        label.font = UIFont.mainFont(font: .Helvetica, size: 14)
        label.textColor = .lightGray
        return label
    }()
    let ratingIMG : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "rateing")
        return img
        
    }()
    let morelabel : UILabel = {
       let label = UILabel()
        label.text = "23 reviews"
        label.textColor = .mainColor()
        label.textAlignment = .right
        label.font = UIFont.mainFont(font: .Helvetica, size: 10)
      return label
    }()
    let mapImg : UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "Map")
        return img
    }()
   
    override init(frame: CGRect) {
        super.init(frame:frame)
        addStack()
        self.sv([CheckButton,stack,headerCommetLabel,ratingIMG,commentLabel,morelabel,mapImg])
       
        self.backgroundColor = .white
        self.layout(
            10,
            |-50-CheckButton-50-| ~ 40,
            30,
            |-0-stack-0-| ~ 60,
            10,
            |-10-headerCommetLabel-150-|,
            |-10-ratingIMG-200-| ~ 20,
            |-10-commentLabel-0-| ~ 100,
            |-200-morelabel-0-|,
            10,
            |-30-mapImg-30-| ~ 150
            
           
        )
    }
    @objc func checPush (){
        pushCV?()
    }
    func addStack(){
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
         stack.spacing = 10
        stack.addArrangedSubview(wifiView)
        stack.addArrangedSubview(eatView)
        stack.addArrangedSubview(dogView)
        stack.addArrangedSubview(tvView)
        stack.addArrangedSubview(swimView)
    }
    required init?(coder: NSCoder) {
        super.init(coder : coder)
    }
}
