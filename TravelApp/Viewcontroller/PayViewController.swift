
//
//  PayViewController.swift
//  TravelApp
//
//  Created by Toan on 7/30/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia

class PayViewController: UIViewController {
    let nameLable : customPay = {
    let label = customPay()
        label.firstLabel.text = "Tên nguời dùng"
        
        return label
    }()
    let startPontLable : customPay = {
    let label = customPay()
        label.firstLabel.text = "Điểm đi"

        return label
    }()
    let endPontLabel : customPay = {
    let label = customPay()
        label.firstLabel.text = "Điểm đến "

        return label
    }()
    let dayStartLabel : customPay = {
    let label = customPay()
        label.firstLabel.text = "Ngày đi"

        return label
    }()
    let dayEndLabel : customPay = {
    let label = customPay()
        label.firstLabel.text = "Ngày đến"

        return label
    }()
    let numberLabel : customPay = {
    let label = customPay()
        label.firstLabel.text = "Số luợng"

        return label
    }()
    let CheckButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "check"), for: .normal)
        button.backgroundColor = .mainColor()
        button.layer.cornerRadius = 10
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSv()
        layout()
    }
    
    func addSv(){
        self.view.sv([nameLable,startPontLable,endPontLabel,dayStartLabel,dayEndLabel,numberLabel,CheckButton])
    }
    func layout(){
        self.view.layout(
            150,
            |-30-nameLable-10-| ~ 50,
            30,
            |-30-startPontLable-10-| ~ 50,
            30,
            |-30-endPontLabel-10-| ~ 50,
            30,
            |-30-dayStartLabel-10-| ~ 50,
            30,
            |-30-dayEndLabel-10-| ~ 50,
            30,
            |-30-numberLabel-10-| ~ 50,
            50,
            |-80-CheckButton.centerHorizontally()-80-| ~ 50
            
            
            
            
        )
       
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
