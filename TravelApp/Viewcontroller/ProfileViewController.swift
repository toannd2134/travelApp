//
//  profileViewController.swift
//  TravelApp
//
//  Created by Toan on 7/16/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
import Firebase
fileprivate let editCell = "editCell"
fileprivate let editCell2 = "editCell2"
class profileViewController: UIViewController {
    let headerLabel : UILabel = {
       let label = UILabel()
        label.text = "Ca nhan"
        label.font = UIFont.mainFont(font: .Helvetica, size: 25)
        return label
    }()
    let avatarImage : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar2")
        return imageView
    }()
    let nameLable : UILabel = {
        let label = UILabel()
        label.text = "Toan Nguyen"
        return label
    }()
    let locationLable : UILabel = {
           let label = UILabel()
           label.text = "Hanoi,VietNam"
        label.font = UIFont.mainFont(font: .Helvetica, size: 10)
        label.textColor = .darkGray
           return label
       }()
    let emailLable : UILabel = {
           let label = UILabel()
           label.text = "toannd213@gmail.com"
        label.font = UIFont.mainFont(font: .Helvetica, size: 10)
        label.textColor = .darkGray
           return label
       }()
    let edittable : UITableView = {
        let table = UITableView()
        table.register(profielTableViewCell.self, forCellReuseIdentifier: editCell)
        table.register(Profile2TableViewCell.self, forCellReuseIdentifier: editCell2)
        return table
        
    }()
    let exitButton : UIButton = {
       let button = UIButton()
        button.setTitle("Thoat", for: .normal)
        button.addTarget(self, action: #selector(signOut), for: .touchUpInside)
        button.backgroundColor = .mainColor()
        button.layer.cornerRadius = 10
        return button
    }()
    let data1 = ProfileData()
    let scroll = UIScrollView()
    let contentview = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor  = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: headerLabel)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        edittable.delegate = self
        edittable.dataSource = self
        adSV()
        edittable.tableFooterView = UIView()
        layout()
        
    }
    func adSV(){
        self.view.sv(scroll)
        scroll.sv(contentview)
        self.contentview.sv([avatarImage,locationLable,nameLable,emailLable,edittable,exitButton])
    }
    func layout() {
        self.view.layout(
        0,
        |-0-scroll-0-|,0)
        scroll.layout(
            0,
            |-0-contentview.width(UIScreen.screenWidth())-0-| ~ 896,0
                      )
        contentview.layout(
        100,
        |-20-avatarImage.width(60)-300-| ~ 100
      )
        contentview.layout(
        100,
        |-(UIScreen.screenWidth()-250)-nameLable-10-|,
        10,
        |-(UIScreen.screenWidth()-250)-locationLable-10-|,
        10,
        |-(UIScreen.screenWidth()-250)-emailLable-10-|,
        30,
        |-0-edittable.width(UIScreen.screenWidth()-20)-0-| ~ 500,
        30,
        |-20-exitButton-20-| ~ 40
        
        
        
        )
    }
    @objc func  signOut (){
      
        self.dismiss(animated: true, completion: nil)
    }
  
    
}

extension profileViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: editCell, for: indexPath) as! profielTableViewCell
            cell.titlelabel.text = data1[indexPath.row].headerLabel
            cell.choiceLabel.text = data1[indexPath.row].mainLabel
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: editCell2, for: indexPath) as! Profile2TableViewCell
            cell.titlelabel.text = data1[indexPath.row].headerLabel
            return cell
        }
    }
    
    
    
    
}
