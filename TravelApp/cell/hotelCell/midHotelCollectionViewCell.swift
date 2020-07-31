//
//  midHotelCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/22/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class midHotelCollectionViewCell: UICollectionViewCell {
   var delegate : cellDelegate?
    let midColection : UICollectionView   = {
       let layout  = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.register(horizontalMidCollectionViewCell.self, forCellWithReuseIdentifier: "midHotelCell")
        return collection
    }()
    let data = hotelData()
    var numberSection = Int()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sv(midColection)
        self.layout(
            0,
            |-10-midColection.width(UIScreen.screenWidth())-0-|
            ,0
        
        )
        midColection.backgroundColor = .clear
        self.midColection.delegate = self
        self.midColection.dataSource = self
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
extension midHotelCollectionViewCell : UICollectionViewDelegateFlowLayout , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[numberSection].local.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "midHotelCell", for: indexPath) as! horizontalMidCollectionViewCell
        cell.localImg.image = data[numberSection].local[indexPath.row].imageLocal
        cell.nameLabel.text = data[numberSection].local[indexPath.row].name
        cell.diriptionLabel.text = data[numberSection].local[indexPath.row].decription
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.colCategory(indexPath)
    }
    
    
}
