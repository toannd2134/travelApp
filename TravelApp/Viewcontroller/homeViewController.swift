//
//  homeViewController.swift
//  TravelApp
//
//  Created by Toan on 7/13/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
class homeViewController: UIViewController {
    let widthScreen  = UIScreen.main.bounds.width
    let heghtScreen  = UIScreen.main.bounds.height
     
    let maincolectionView : UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.register(UINib(nibName: "topCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
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
    }
    func layout(){
        view.layout(-50,
                    |-0-maincolectionView.width(widthScreen)-0-| ~ heghtScreen,0
        )
    }

}
extension homeViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource ,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: widthScreen, height: heghtScreen)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell"  , for: indexPath) as! topCollectionViewCell
        return cell
    }
    
    
}
