//
//  FeedCell.swift
//  Tours
//
//  Created by Szymon Szysz on 26.06.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import UIKit


protocol CollectionCellDelegate {
    func selectedItem()
}

class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var delegate: CollectionCellDelegate?
    let cellId = "cellId"
    var citysPhoto = ["Plik00001.jpg","Plik00002.jpg","Plik00003.jpg","Plik00004.jpg","Plik00005.jpg"]
    var citysName = ["New York", "Warsaw","San Diego","Los Angeles", "Katowice"]
    

    override func setupViews() {
        super.setupViews()
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        collectionView.register(TourCell.self, forCellWithReuseIdentifier: cellId)
    
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        return cv
        
    }()
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return citysPhoto.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TourCell
        cell.thumbnailImageView.image = UIImage(named: citysPhoto[indexPath.row])
        cell.titleLabel.text = citysName[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width, height: 226)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectedItem()
    }
}
