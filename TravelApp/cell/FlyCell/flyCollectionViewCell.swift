//
//  flyCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/18/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class topflyCollectionViewCell: UICollectionViewCell {
    let insideColection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let colection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        colection.register(ReuseableCollectionViewCell.self, forCellWithReuseIdentifier: "reuseCell")
        
        
        return colection
    }()
    let data = flyData()
    override init(frame: CGRect) {
        super.init(frame: frame)
        insideColection.delegate = self
        insideColection.dataSource = self
        insideColection.backgroundColor = .clear
        self.sv(insideColection)
        self.layout(
        0,
        |-10-insideColection-0-| ,0
        )
       
      
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
extension topflyCollectionViewCell : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150 , height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseCell", for: indexPath) as! ReuseableCollectionViewCell
        cell.bacgroundImg.image = data[indexPath.section].local[indexPath.row].imageLocal
        cell.nameLabel.text = data[indexPath.section].local[indexPath.row].name
        
        return cell
    }
    
   
  
}
