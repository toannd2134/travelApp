//
//  bottomCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/20/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class bottomCollectionViewCell: UICollectionViewCell {
    let mainColection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.register(ReuseableCollectionViewCell.self, forCellWithReuseIdentifier: "reuserCell")
        
        return collection
    }()
    let dataUser = flyData()
    var numberSection = Int()
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.sv(mainColection)
        self.layout(
        0,
        |-0-mainColection-0-| , 0
        )
        mainColection.delegate = self
        mainColection.dataSource = self
        mainColection.backgroundColor = .clear
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
extension bottomCollectionViewCell : UICollectionViewDelegateFlowLayout ,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: 150 , height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataUser[numberSection].local.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuserCell", for: indexPath) as! ReuseableCollectionViewCell
        
        cell.bacgroundImg.image = dataUser[numberSection].local[indexPath.row].imageLocal
        cell.nameLabel.text = dataUser[numberSection].local[indexPath.row].name
        return cell
    }
    
    
}
