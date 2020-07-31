//
//  topHotelCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/22/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class topHotelCollectionViewCell: UICollectionViewCell{
    var delegate : cellDelegate?
    let data = hotelData()
    let topCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.register(ReuseableCollectionViewCell.self, forCellWithReuseIdentifier: "topHotelCell")
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        topCollection.delegate = self
        topCollection.dataSource = self
        topCollection.backgroundColor = .clear
        self.sv(topCollection)
        self.layout(
        0,
        |-10-topCollection.width(UIScreen.screenWidth())-0-| , 0
        )
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
extension topHotelCollectionViewCell :  UICollectionViewDelegateFlowLayout , UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:150, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topHotelCell", for: indexPath) as! ReuseableCollectionViewCell
        cell.nameLabel.text = data[0].local[indexPath.row].name
        cell.bacgroundImg.image = data[0].local[indexPath.row].imageLocal
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.colCategory(indexPath)
       
    }
   
    
    
    
    
}
