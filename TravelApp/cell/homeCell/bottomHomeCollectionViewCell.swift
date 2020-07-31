//
//  bottomHomeCollectionViewCell.swift
//  TravelApp
//
//  Created by Toan on 7/27/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit
import Stevia
fileprivate  let moreCell = "moreCell"
class bottomHomeCollectionViewCell: UICollectionViewCell {
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Carmel, California"
        label.font = UIFont(name: "Helvetica-bold", size: 22)
        label.textColor = .backgroundView()
        return label
    }()
    let decribeLabel : UILabel = {
        let label = UILabel()
        label.text = "Địa điểm lãng mạng bậc nhất USA"
        label.font = UIFont.mainFont(font: .Helvetica, size: 16)
        return label
    }()
    let decribeLabel2 : UILabel = {
        let label = UILabel()
        label.text = "Hollywood là một điểm đến duy nhất ở bang mà biết làm thế nào để khơi dậy một câu chuyện tình yêu dành cho lứa tuổi - chúng tôi đã chọn một danh sách các địa điểm tạo nên cảnh lãng mạn. Đọc thêm"
        label.numberOfLines = 0
        label.font = UIFont.mainFont(font: .Helvetica, size: 12)
        return label
    }()
    let moreLabel : UILabel = {
        let label = UILabel()
        label.text = "Them.."
        label.font = UIFont.mainFont(font: .Helvetica, size: 14)
        return label
    }()
    let moreCollection : UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(MoreCollectionViewCell.self, forCellWithReuseIdentifier: moreCell)
        layout.scrollDirection = .horizontal
        
        return collection
    }()
    let data = moreData()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addsv()
        layout()
        moreCollection.delegate = self
        moreCollection.dataSource  = self
        moreCollection.backgroundColor = .clear
    }
    func addsv(){
        self.sv([nameLabel,decribeLabel,decribeLabel2,moreLabel,moreCollection])
    }
    func layout(){
        self.layout(
        10,
        |-10-nameLabel-100-|,
        30,
        |-10-decribeLabel-10-|,
        10,
        |-10-decribeLabel2-10-| ~ 100,
        |-10-moreLabel-100-|,
        |-10-moreCollection-10-| ~ 300
        
        )
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
extension bottomHomeCollectionViewCell : UICollectionViewDelegateFlowLayout ,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: moreCell, for: indexPath) as! MoreCollectionViewCell
        cell.bacgroundImgae.image = data[indexPath.row].bacimg
        cell.titleLabel.text = data[indexPath.row].title
        return cell
    }
    
    
    
    
}
