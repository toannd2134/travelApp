
//
//  propertiViewController.swift
//  TravelApp
//
//  Created by Toan on 7/23/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class propertiViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "toplId"
    fileprivate let headerId = "headerId"
    fileprivate let midCell = "midCell"
    fileprivate let bottomCell = "bottomCell"
    fileprivate let padding: CGFloat = 16
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionViewLayout()
        setupCollectionView()
    }
    @objc  func dismis(){
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setupCollectionView() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(dismis))
        self.navigationController?.navigationBar.barTintColor = .white
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        collectionView.register(topPropertiesColectionView.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(MidPropertiesCollectionViewCell.self, forCellWithReuseIdentifier: midCell)
        collectionView.register(BottomPropertiesCollectionViewCell.self, forCellWithReuseIdentifier:bottomCell)
        
        collectionView.register(headerPropertiesCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! topPropertiesColectionView
            
            
            return cell
        }else  if indexPath.row == 1{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: midCell, for: indexPath) as! MidPropertiesCollectionViewCell
            
            return cell
            
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bottomCell , for: indexPath) as! BottomPropertiesCollectionViewCell

            cell.CheckButton.addTarget(self, action: #selector(Push), for: .touchUpInside)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 || indexPath.row == 1 {
            return .init(width: view.frame.width - 2 * padding, height: 50)
        }else{
            return .init(width: view.frame.width - 2 * padding, height: 1000)
        }
    }
    @objc func  Push (){
        let vc = CheckingViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

