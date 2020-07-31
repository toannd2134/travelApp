//
//  RegisterViewController.swift
//  TravelApp
//
//  Created by Toan on 7/31/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
import Firebase
class RegisterViewController: UIViewController {
    let signinButton : UIButton = {
        let button = UIButton()
        button.setTitle("sign up", for: .normal)
        button.backgroundColor = .mainColor()
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signUP), for: .touchUpInside)
        return button
    }()
    let nameUser : UITextField = {
        let textFiled = UITextField()
        textFiled.layer.cornerRadius = 10
        textFiled.boderTextField(color: .mainColor(), boderWidth: 5)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textFiled.leftView = view
        textFiled.leftViewMode = .always
        textFiled.placeholder = "ten dang nhap"
        return textFiled
    }()
    let passUser : UITextField = {
        let textFiled = UITextField()
        textFiled.layer.cornerRadius = 10
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textFiled.leftView = view
        textFiled.leftViewMode = .always
        textFiled.boderTextField(color: .mainColor(), boderWidth: 5)
        textFiled.placeholder = "password"
        return textFiled
    }()
    let repassword : UITextField = {
        let textFiled = UITextField()
        textFiled.layer.cornerRadius = 10
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textFiled.leftView = view
        textFiled.leftViewMode = .always
        textFiled.boderTextField(color: .mainColor(), boderWidth: 5)
        textFiled.placeholder = "nhap lai mat khau"
        return textFiled
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.sv([signinButton,nameUser,passUser,repassword])
        view.layout(
            200,
            |-30-nameUser-30-| ~ 50,
            20,
            |-30-passUser-30-| ~ 50,
            20,
            |-30-repassword-30-| ~ 50,
            40,
            |-30-signinButton-30-| ~ 50
            
            
            )
        // Do any additional setup after loading the view.
    }
    @objc func signUP(){
        guard let email = nameUser.text,let password = passUser.text else {
            return
        }
        if isValidEmail(email){
            
            if password.count > 6 {
                FireBaseManager.Share.creatUser(email: email, password: password)
                self.dismiss(animated: true, completion: nil)
            }else{
                let alert = UIAlertController(title: "nhap sai password ", message: "Password phai lon hon 6 ki tu", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }else{
            let alert = UIAlertController(title: "nhap sai gmail", message: "Vui long nhap lai", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
