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
        label.text = "Xin Chao Toan !"
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
        label.text = "chao mung  ban cho lai. Ban muon di dau hom nay ? "
        label.numberOfLines = 0
        label.font = UIFont.mainFont(font: UIFont.fontChoice.Helvetica, size: 16)
        return label
    }()
    let choiceLabel  : UILabel  = {
        let label  = UILabel()
        label.text = "Hay chon noi ban thich!"
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
        texFiled.placeholder = "Tim noi ban muon den "
        texFiled.leftView = UIImageView(image: UIImage(named: "point"))
        texFiled.leftViewMode = .always
        texFiled.backgroundColor = .clear
        return texFiled
    }()
    let tourColectionView :UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.register(tourCollectionViewCell.self, forCellWithReuseIdentifier: "tourCell")
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
        
    }
    func addStackVIew(){
        
        stackViewButton.alignment = .fill
        stackViewButton.distribution = .fillEqually
        stackViewButton.axis = .horizontal
        stackViewButton.spacing = 5
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
        |-20-tourColectionView-20-| ~ 400
        
        )
    }

}
extension topCollectionViewCell : UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width-40, height: 400)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tourCell", for: indexPath) as! tourCollectionViewCell
        cell.backgroundColor = .red
        return cell
    }
    
    
}
