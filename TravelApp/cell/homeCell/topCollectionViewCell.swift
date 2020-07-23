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
        label.text = "chào mừng bạn đã trở lại . hôm nay bạn muốn đi dâu "
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
    let cafeButton : UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "cafe"), for: .normal)
        
        return button
    }()
    let moutainButton : UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "moutain"), for: .normal)
        return button
    }()
    let campButton : UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "camp"), for: .normal)
        return button
    }()
    let greenButton : UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "green"), for: .normal)
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
        collection.register(tourCollectionViewCell.self, forCellWithReuseIdentifier: "tourCell")
         collection.register(headerCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView")
        return collection
        
        
    }()
    
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
        |-20-stackViewButton-20-| ~ 30,
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tourCell", for: indexPath) as! tourCollectionViewCell
        cell.backgroundColor = .clear
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath) as! headerCollectionReusableView
        header.headerview.backgroundColor = UIColor.headerColor()
        header.headerName.text = "Tour danh cho ban "
              return header
          }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.screenWidth(), height: 30)
        }
   
 
    
    
}
