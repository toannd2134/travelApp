//
//  insideCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/29/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
 fileprivate let cellInside  = "cellInside"
class InsideHomeCollectionViewCell: UICollectionViewCell {
    
   
    let insideColec : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let colection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        colection.register(tourInsideCollectionViewCell.self, forCellWithReuseIdentifier: cellInside )
        colection.showsHorizontalScrollIndicator = false
        return colection
    }()
    let user = HomeData()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sv(insideColec)
        self.layout(10,
                    |-10-insideColec-0-|,0)
        insideColec.delegate = self
        insideColec.dataSource = self
        insideColec.backgroundColor = .clear
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
extension InsideHomeCollectionViewCell : UICollectionViewDelegateFlowLayout ,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300 , height: 400)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        user.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellInside, for: indexPath) as! tourInsideCollectionViewCell
        
        cell.bacgroundImg.image = user[indexPath.row].bacgroundImage
        cell.nameLable.text = user[indexPath.row].nameLocation
        cell.dicriptionLabel.text = user[indexPath.row].decribe
        
        return cell
    }
    
    
}
