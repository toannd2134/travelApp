//
//  flyViewController.swift
//  TravelApp
//
//  Created by Toan on 7/16/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import  Stevia
class flyViewController: UIViewController,cellDelegate {
    
    

    let NameLabel  : UILabel = {
        let label = UILabel()
        label.text = "Chuyến bay"
        label.font = UIFont
            .mainFont(font: .Thonburi, size: 26)
       return label
        }()
    let localtexFiled : UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.placeholder = "Nơi bạn muốn đến ? "
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
    var numberOfSection = 1
    let mainColection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let colection = UICollectionView(frame: .zero , collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        colection.backgroundColor = .clear
        colection.register(headerCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCell")
        colection.register(topflyCollectionViewCell.self, forCellWithReuseIdentifier: "flyCell")
        colection.register(midCollectionViewCell.self, forCellWithReuseIdentifier: "midCell")
        colection.register(bottomCollectionViewCell.self, forCellWithReuseIdentifier: "bottomCell")
        return colection
    }()
    let flyLocal = flyData()
    override func viewDidLoad() {
        super.viewDidLoad()
        addsv()
        layout()
       navifationSetup()
        view.addSubview(localtexFiled)
        self.view.backgroundColor = .white
        mainColection.delegate = self
        mainColection.dataSource =  self
        mainColection.backgroundColor = .clear
       
      
    }
    func navifationSetup(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: NameLabel)
               self.navigationController?.navigationBar.shadowImage = UIImage()
               self.navigationController?.navigationBar.isTranslucent = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.localtexFiled.frame = CGRect(x: 50, y: (self.navigationController?.navigationBar.frame.height)!+50, width: (self.navigationController?.navigationBar.frame.width)!-100, height: 30)
        self.navigationHeght = (self.navigationController?.navigationBar.frame.height)!+30
        localtexFiled.backgroundColor = UIColor.white
    }
    func addsv() {
        self.view.sv(mainColection)
    }
    func layout(){
        view.layout(
            (self.navigationController?.navigationBar.frame.height)!+90 ,
            |-0-mainColection.width(UIScreen.screenWidth())-0-| ~ UIScreen.screenHeight()
            
        )
    }
    func colCategory(_ indexPath: IndexPath) {
        let vc  = propertiViewController(collectionViewLayout:StretchyHeader())
        
        let navigation = UINavigationController(rootViewController: vc)
        navigation.modalPresentationStyle  = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
}
extension flyViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
        return CGSize(width: UIScreen.screenWidth(), height: 200)
        } else if indexPath.section == 1{
            return CGSize(width: UIScreen.screenWidth(), height: 150)
        }else{
             return CGSize(width: UIScreen.screenWidth(), height: 200)
        }
    }
        
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let safeAreaTop : CGFloat = 88
//
        self.localtexFiled.transform = .init(translationX: 0, y: -scrollView.contentOffset.y)
       self.mainColection.transform = .init(translationX: 0, y: -scrollView.contentOffset.y)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return flyLocal.count
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = indexPath.section
        if section == 0{
        let reuseable = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCell", for: indexPath) as! headerCollectionReusableView
        reuseable.headerview.backgroundColor = .white
        reuseable.headerName.text = flyLocal[indexPath.section].nameSection
        reuseable.expandLabel.text = "them.."
        
        return reuseable
        }else if section == 1 {
            let reuseable = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCell", for: indexPath) as! headerCollectionReusableView
            reuseable.headerview.backgroundColor = .white
            reuseable.headerName.text = flyLocal[indexPath.section].nameSection
            reuseable.expandLabel.text = "them.."
            return reuseable
        }else{
            let reuseable = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCell", for: indexPath) as! headerCollectionReusableView
            reuseable.headerview.backgroundColor = .white
            reuseable.headerName.text = flyLocal[indexPath.section].nameSection
            reuseable.expandLabel.text = "them.."
            return reuseable
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
         if  section == 0 {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "flyCell", for: indexPath) as! topflyCollectionViewCell
            cell.delegate = self
          return cell
        }else if section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "midCell", for: indexPath) as! midCollectionViewCell
            cell.numberSection = 1
            cell.delegate = self
            return cell
         }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bottomCell", for: indexPath) as! bottomCollectionViewCell
            cell.numberSection = 2
             cell.delegate = self
            return cell
        }
      }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.screenWidth(), height: 30)
    }
}
