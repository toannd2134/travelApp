//
//  midCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/20/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class midCollectionViewCell: UICollectionViewCell {
    
    let mainColectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let colection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection =  .horizontal
        colection.register(horizontalMidCollectionViewCell.self, forCellWithReuseIdentifier: "horizontalCell")
        return colection
        
    }()
    var data = flyData()
    var numberSection = Int()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.mainColectionView.delegate = self
        self.mainColectionView.dataSource = self
        self.sv(mainColectionView)
        self.layout(
        0,
        |-10-mainColectionView-0-| ,0
          )
        mainColectionView.backgroundColor =     .clear

    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
extension midCollectionViewCell : UICollectionViewDelegateFlowLayout , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[numberSection].local.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "horizontalCell", for: indexPath) as! horizontalMidCollectionViewCell
        cell.localImg.image = data[numberSection].local[indexPath.row].imageLocal
        cell.nameLabel.text = data[numberSection].local[indexPath.row].name
        cell.diriptionLabel.text = data[numberSection].local[indexPath.row].decription
        return cell
    }
    
    
    
}
