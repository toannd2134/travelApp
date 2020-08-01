//
//  HotelCollectionViewController.swift
//  TravelApp
//
//  Created by Toan on 8/1/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
fileprivate let headerId = "headerId"
class HotelCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: nil)
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.collectionView!.register(HotelCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(headerPropertiesCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
       setupCollectionViewLayout()
    }

   fileprivate func setupCollectionViewLayout() {
          if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
              layout.sectionInset = .init(top: 16, left: 16, bottom: 16, right: 16)
          }
      }

    // MARK: UICollectionViewDataSource

    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
       
        return header
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return .init(width: view.frame.width, height: 300)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
      
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HotelCollectionViewCell
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HotelCollectionViewCell
            
            return cell
        }
        
        
        
    }
    
    
}
