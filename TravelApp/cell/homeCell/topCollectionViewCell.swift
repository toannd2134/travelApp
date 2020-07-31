//
//  topCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/12/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class topCollectionViewCell: UICollectionViewCell {
    
   
    let ferewellLabel : UILabel  = {
        let label  = UILabel()
        label.text = "Xin chào Toàn!"
        label.numberOfLines = 0
        label.font = UIFont.mainFont(font: UIFont.fontChoice.Helvetica, size: 27)
        return label
    }()
    let userImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avatar" )
        return image
    }()
    let ferewellLabel2 : UILabel  = {
        let label  = UILabel()
        label.text = "chào mừng bạn đã trở lại . hôm nay bạn muốn đi đâu "
        label.numberOfLines = 0
        label.font = UIFont.mainFont(font: UIFont.fontChoice.Helvetica, size: 16)
        return label
    }()
    let choiceLabel  : UILabel  = {
        let label  = UILabel()
        label.text = "Hãy chọn nơi bạn thích"
        label.numberOfLines = 0
        label.font = UIFont.mainFont(font: UIFont.fontChoice.Helvetica, size: 16)
        return label
    }()
    let cafeButton : buttonView = {
       let button = buttonView()
        button.imageIcon.image = UIImage(named: "cup")
        button.titileLabel.text = "cafe"
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.titileLabel.font = UIFont.mainFont(font: .Helvetica, size: 10)
        
        return button
    }()
    let moutainButton : buttonView = {
       let button = buttonView()
        button.imageIcon.image = UIImage(named: "moutain")
        button.titileLabel.text  = "cắm trại"
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.titileLabel.font = UIFont.mainFont(font: .Helvetica, size: 10)
        return button
    }()
    let campButton : buttonView = {
       let button = buttonView()
        button.imageIcon.image = UIImage(named: "camp")
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.titileLabel.font = UIFont.mainFont(font: .Helvetica, size: 10)
        button.titileLabel.text  = "khám phá"
        return button
    }()
    let greenButton : buttonView = {
       let button = buttonView()
        button.imageIcon.image = UIImage(named: "green")
        button.titileLabel.text  = "thiên nhiên"
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.titileLabel.font = UIFont.mainFont(font: .Helvetica, size: 10)
         return button
    }()
    let stackViewButton = UIStackView()
   
    let localTexField : UITextField = {
        let texFiled = UITextField()
        texFiled.placeholder = "Tìm nơi bạn muốn đến "
        texFiled.leftView = UIImageView(image: UIImage(named: "point"))
        texFiled.leftViewMode = .always
        texFiled.backgroundColor = .clear
        return texFiled
    }()
    let tourColectionView :UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.register(InsideHomeCollectionViewCell.self, forCellWithReuseIdentifier: "tourCell")
         collection.register(headerCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView")
        return collection
        
        
    }()
    let user = HomeData()
    override func awakeFromNib() {
        super.awakeFromNib()
        addStackVIew()
        addSubView()
        layout()
        self.backgroundView = UIImageView(image: UIImage(named: "bacground"))
        tourColectionView.delegate = self
        tourColectionView.dataSource = self
        tourColectionView.backgroundColor = .clear
        tourColectionView.bounces = false
        
    }
    func addStackVIew(){
        
        stackViewButton.alignment = .fill
        stackViewButton.distribution = .fillEqually
        stackViewButton.axis = .horizontal
        stackViewButton.spacing = 30
        stackViewButton.addArrangedSubview(cafeButton)
        stackViewButton.addArrangedSubview(moutainButton)
        stackViewButton.addArrangedSubview(campButton)
        stackViewButton.addArrangedSubview(greenButton)
    }
    
    func addSubView() {
        
        self.sv([ferewellLabel,ferewellLabel2,userImage,choiceLabel,stackViewButton,localTexField,tourColectionView])
      }
    func layout(){
        
        self.layout(
        90,
        |-20-ferewellLabel-20-userImage.width(20)-20-| ~ 20,
        50,
        |-20-ferewellLabel2-170-|,
        50,
        |-20-choiceLabel-170-|,
        30,
        |-20-stackViewButton-20-| ~ 50,
        30,
        |-20-localTexField-20-| ~ 30,
        30,
        |-0-tourColectionView-0-| ~ 500
        
        )
    }

}
extension topCollectionViewCell : UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 400)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tourCell", for: indexPath) as! InsideHomeCollectionViewCell
       return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath) as! headerCollectionReusableView
        header.headerview.backgroundColor = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1.00)
        header.headerName.text = "Tour dành cho bạn "
              return header
          }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.screenWidth(), height: 30)
        }
   
 
    
    
}
