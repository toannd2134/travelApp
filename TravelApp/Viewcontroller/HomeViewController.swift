//
//  homeViewController.swift
//  TravelApp
//
//  Created by Toan on 7/13/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
 fileprivate let headerCell = "header"
fileprivate let botomCell = "bottomCell"
class HomeViewController: UIViewController {
    
    
    let maincolectionView : UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.register(UINib(nibName: "topCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collection.register(headerCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCell )
        collection.register(bottomHomeCollectionViewCell.self, forCellWithReuseIdentifier: botomCell)
        collection.bounces = false
        return collection
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.sv(maincolectionView)
        layout()
        maincolectionView.delegate = self
        maincolectionView.dataSource = self
        maincolectionView.backgroundColor = .clear
    }
    func layout(){
        view.layout(-80,
                    |-0-maincolectionView.width(UIScreen.screenWidth())-0-| ~ UIScreen.screenHeight(),0
        )
    }

}
extension HomeViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource ,UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if indexPath.section == 0 {
            return CGSize (width: UIScreen.screenWidth(), height: 900)
        }else{
            return CGSize(width:  UIScreen.screenWidth(), height: 500)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell"  , for: indexPath) as! topCollectionViewCell
        
            return cell
        }else{
          let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: botomCell  , for: indexPath) as! bottomHomeCollectionViewCell
          
              return cell
        }
            
       
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.screenWidth(), height: 30)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 1 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCell, for: indexPath) as! headerCollectionReusableView
            header.headerName.text = "Tour được đánh giá cao"
            header.backgroundColor = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1.00)
            return header
        }else{
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell"  , for: indexPath) as! topCollectionViewCell
            
            return cell
        }
    }
//     khoang cach giua 2 dong
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    // khoang cach giua  hai cot
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
    
   
}
