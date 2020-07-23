//
//  bottomHotelCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/22/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class bottomHotelCollectionViewCell: UICollectionViewCell {
    let botomHotelCollection : UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let colection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        colection.register(ReuseableCollectionViewCell.self, forCellWithReuseIdentifier: "bottomHotelCell")
        
        return colection
    }()
    let data = hotelData()
    var numbersection = Int(0)
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sv(botomHotelCollection)
        
        self.layout(
        0,
        |-10-botomHotelCollection-0-| ,
        0
        )
        self.botomHotelCollection.delegate = self
        self.botomHotelCollection.dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
extension bottomHotelCollectionViewCell : UICollectionViewDelegateFlowLayout ,UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 150 , height: 200)
            
        }else {
            return CGSize(width: 200, height: 50)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomHotelCell", for: indexPath ) as! ReuseableCollectionViewCell
        cell.bacgroundImg.image = data[numbersection].local[indexPath.row].imageLocal
        cell.nameLabel.text = data[numbersection].local[indexPath.row].name
        
        return cell
    }
    
   
    
    
}
