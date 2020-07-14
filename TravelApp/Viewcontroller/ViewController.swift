//
//  ViewController.swift
//  TravelApp
//
//  Created by Toan on 7/12/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class ViewController: UIViewController {
    let LogoImage : UIImageView = {
         let image = UIImageView()
        image.image = UIImage(named: "logo")
        
        return image
    }()
    let signinLabel : UILabel  = {
        let label = UILabel()
        label.text   = "Sign in"
        label.font = UIFont(name: "Athelas", size: 37)
        return label
    }()
    let EmailTextFiled : UITextField  = {
        let  texField  = UITextField()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        texField.leftView = view
        texField.leftViewMode = .always
        texField.backgroundColor = .backgroundTexFiled()
        texField.layer.cornerRadius = 10
        texField.placeholder = "Email adress"
        return texField
    }()
    let PasswordTexFiled : UITextField  = {
        let  texField  = UITextField()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        texField.leftView = view
        texField.leftViewMode = .always
        texField.layer.cornerRadius = 10
        texField.backgroundColor = .backgroundTexFiled()
        texField.placeholder = "password"
        return texField
    }()
    let  SiginButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .mainColor()
        button.layer.cornerRadius = 25
        button.setTitle("Dang nhap", for: .normal)
        return button
    }()
    let signUP : UILabel  = {
        let label = UILabel()
        label.text   = "dang ki"
        label.textAlignment = .right
        label.font = UIFont(name: "Athelas", size: 20)
        return label
    }()
    let  SignUPButton : UIButton = {
           let button = UIButton()
           button.backgroundColor = .clear
           button.layer.cornerRadius = 25
           button.setTitle("tai day", for: .normal)
        
        button.setTitleColor(.red, for: .normal)
           return button
       }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundColor()
        addSudView()
        layout()
    }
    func addSudView(){
        view.sv([LogoImage,signinLabel,EmailTextFiled,PasswordTexFiled,SiginButton,signUP,SignUPButton])
    }
    func layout(){
        view.layout(
            50,
            |-100-LogoImage.centerHorizontally().width(200)-100-|,
            32,
            |-150-signinLabel.centerHorizontally()-150-| ~ 50,
            50,
            |-50-EmailTextFiled-50-| ~ 50,
            20,
            |-50-PasswordTexFiled-50-| ~ 50,
            50,
            |-50-SiginButton-50-| ~  50,
            10,
            |-250-signUP-05-SignUPButton-30-| ~ 20
        )
    }


}

