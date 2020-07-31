//
//  hotelViewController.swift
//  TravelApp
//
//  Created by Toan on 7/16/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
protocol cellDelegate {
    func colCategory (  _ indexPath : IndexPath)
}
class hotelViewController: UIViewController, cellDelegate{
  
    
    
    let  headerlabel : UILabel = {
       let label = UILabel()
        label.text = "Khách sạn"
        label.font = UIFont.mainFont(font: .Thonburi, size: 26)
        return label
    }()
    let localtexFiled : UITextField = {
           let textField = UITextField()
           textField.borderStyle = .none
           textField.placeholder = "Bạn muốn đi đâu ? "
           textField.backgroundColor = UIColor.groupTableViewBackground // Use anycolor that give you a 2d look.
           //To apply corner radius
           textField.layer.cornerRadius = 15

           //To apply border
           textField.layer.borderWidth = 0.25
           textField.layer.borderColor = UIColor.white.cgColor

           //To apply Shadow
           textField.layer.shadowOpacity = 1
           textField.layer.shadowRadius = 3.0
           textField.layer.shadowOffset = CGSize.zero // Use any CGSize
           textField.layer.shadowColor = UIColor.gray.cgColor

           let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
           textField.leftView = paddingView
           textField.leftViewMode = .always
           
           return textField
       }()
     var navigationHeght = CGFloat()
    let data = hotelData()
    let mainColection  : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let colection  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        colection.register(topHotelCollectionViewCell.self, forCellWithReuseIdentifier: "topHotelCell")
        colection.register(headerCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerHotelCell")
        colection.register(midHotelCollectionViewCell.self, forCellWithReuseIdentifier: "midHotelCell")
        colection.register(bottomHotelCollectionViewCell.self, forCellWithReuseIdentifier: "bottomHotelCell")
        
        return colection
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       self.view.backgroundColor = .white
        navigationSetup()
        self.view.addSubview(localtexFiled)
        self.view.sv(mainColection)
        mainColection.delegate = self
        mainColection.dataSource = self
        self.view.layout(
            (self.navigationController?.navigationBar.frame.height)! + 120 ,
            |-0-mainColection.width(UIScreen.screenWidth())-0-| , 0
        )
        mainColection.backgroundColor = .clear
    }
    func navigationSetup(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: headerlabel)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    func colCategory(_ indexPath: IndexPath) {
        
        let vc  = propertiViewController(collectionViewLayout:StretchyHeader())
        
        let navigation = UINavigationController(rootViewController: vc)
        navigation.modalPresentationStyle  = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.localtexFiled.frame = CGRect(x: 50, y: (self.navigationController?.navigationBar.frame.height)!+50, width: (self.navigationController?.navigationBar.frame.width)!-100, height: 30)
        self.navigationHeght = (self.navigationController?.navigationBar.frame.height)!+50
        localtexFiled.backgroundColor = UIColor.white
    }
    
}
extension hotelViewController : UICollectionViewDelegateFlowLayout , UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
        return CGSize(width: UIScreen.screenWidth(), height: 200)
        }else if indexPath.section == 1{
            return CGSize(width: UIScreen.screenWidth(), height: 160)
        }else{
          return CGSize(width: UIScreen.screenWidth(), height: 200)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topHotelCell", for: indexPath) as! topHotelCollectionViewCell
            cell.delegate = self
        return cell
        }else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "midHotelCell", for: indexPath) as! midHotelCollectionViewCell
            cell.delegate = self
            cell.numberSection = 1
            return cell
        }else {
            let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomHotelCell", for: indexPath) as! bottomHotelCollectionViewCell
            cell.delegate = self
            cell.numbersection = 2
            return cell
        }
    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    //        let safeAreaTop : CGFloat = 88
//    //
//            self.localtexFiled.transform = .init(translationX: 0, y: -scrollView.contentOffset.y)
//           self.mainColection.transform = .init(translationX: 0, y: -scrollView.contentOffset.y)
//        }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reuseable = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerHotelCell", for: indexPath) as! headerCollectionReusableView
        reuseable.headerName.text = data[indexPath.section].nameSection
        return reuseable
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.screenWidth(), height: 30)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc  = propertiViewController(collectionViewLayout:StretchyHeader())
        let navigation = UINavigationController(rootViewController: vc)
        self.navigationController?.pushViewController(navigation, animated: true)
        
        
    }
    
    
}
