//
//  ViewController.swift
//  TravelApp
//
//  Created by Toan on 7/12/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
import Firebase
class ViewController: UIViewController {
    let LogoImage : UIImageView = {
         let image = UIImageView()
        image.image = UIImage(named: "logo")
        
        return image
    }()
    let signinLabel : UILabel  = {
        let label = UILabel()
        label.text   = "Sign in"
        label.textAlignment = .center
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
        texField.placeholder = "Địa chỉ Email"
        return texField
    }()
    let PasswordTexFiled : UITextField  = {
        let  texField  = UITextField()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        texField.leftView = view
        texField.leftViewMode = .always
        texField.layer.cornerRadius = 10
        texField.backgroundColor = .backgroundTexFiled()
        texField.placeholder = "Mật khẩu"
        texField.isSecureTextEntry = true
        return texField
    }()
    let  SiginButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .mainColor()
        button.layer.cornerRadius = 25
        button.setTitle("Đăng nhập", for: .normal)
         button.addTarget(self, action: #selector(Signin), for: .touchUpInside)
        return button
    }()
    let signUP : UILabel  = {
        let label = UILabel()
        label.text   = "đăng kí"
        label.textAlignment = .right
        label.font = UIFont(name: "Athelas", size: 20)
        return label
    }()
    let  SignUPButton : UIButton = {
           let button = UIButton()
           button.backgroundColor = .clear
           button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(SignUP), for: .touchUpInside
        )
           button.setTitle("tại đây", for: .normal)
       
        button.setTitleColor(.red, for: .normal)
           return button
    }()
    var selectedTextField: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.backgroundColor()
        addSudView()
        layout()
        EmailTextFiled.delegate = self
        PasswordTexFiled.delegate  = self
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        //đăng ký nhận thông báo khui có sự kiện ẩn bàn phím
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
    }
    func addSudView(){
        view.sv([LogoImage,signinLabel,EmailTextFiled,PasswordTexFiled,SiginButton,signUP,SignUPButton])
    }
    func layout(){
        view.layout(
            50,
            |-100-LogoImage.centerHorizontally().width(100)-100-|,
            20,
            |-0-signinLabel.centerHorizontally()-0-| ~ 50,
            20,
            |-50-EmailTextFiled-50-| ~ 50,
            20,
            |-50-PasswordTexFiled-50-| ~ 50,
            20,
            |-50-SiginButton-50-| ~  50,
            10,
            |-220-signUP-05-SignUPButton-30-| ~ 20
        )
    }
    @objc func Signin (){
        guard let email = EmailTextFiled.text ,let password = PasswordTexFiled.text else{return}
        FireBaseManager.Share.SignIn(email: email, password: password) { (sucess) in
            if sucess {
                let vc = TabarViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                
                
               
                
            }else{
                let alert = UIAlertController(title: "sai mật khẩu hoặc password", message: "Vui long nhap lai", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    @objc func SignUP(){
        let vc = RegisterViewController()
       
      
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func willShowKeyboard(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if let selectedTextField = selectedTextField {
                if selectedTextField.frame.origin.y > view.frame.height - keyboardSize.height - selectedTextField.bounds.height {
                    
                    self.view.frame.origin.y = 0
                    // đẩy view lên một khoảng là chiều cao bàn phím
                    self.view.frame.origin.y -= (keyboardSize.height-100)
                }
            }
            
        }
        
    }
    @objc func willHideKeyboard(_ notification: NSNotification) {
        self.view.frame.origin.y = 0
    }

}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case EmailTextFiled:
            PasswordTexFiled.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        selectedTextField = textField
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        return true
        
    }
    
}

