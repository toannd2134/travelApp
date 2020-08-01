//
//  HotelCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 8/1/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
fileprivate  let CellID = "cell"
class HotelCollectionViewCell: UICollectionViewCell {
    
    let collectionMain : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.register(TopHotelPropertiesCollectionViewCell.self, forCellWithReuseIdentifier:CellID)
        return collection
    }()
    let Images = ["hote1","hote3","hote4"]
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.sv([collectionMain])
        self.layout(0,
                    |-0-collectionMain-0-|,0)
        collectionMain.delegate = self
        collectionMain.dataSource = self
        collectionMain.backgroundColor = .clear
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension HotelCollectionViewCell : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celll = collectionView.dequeueReusableCell(withReuseIdentifier: CellID, for: indexPath ) as! TopHotelPropertiesCollectionViewCell
        celll.backgroundColor = .red
        return celll
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 100)
    }
    
    
}
