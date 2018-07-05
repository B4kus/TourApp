//
//  FeedCell.swift
//  Tours
//
//  Created by Szymon Szysz on 26.06.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import UIKit


protocol CollectionCellDelegate {
    func selectedItem(city: String, photoName: String)
}

class FeedCell: BaseCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var delegate: CollectionCellDelegate?
    let cellId = "cellId"
    var citiesPhoto = ["Plik00001.jpg","Plik00002.jpg","Plik00003.jpg","Plik00004.jpg","Plik00005.jpg"]
    var citiesName = ["New York", "Warsaw","San Diego","Los Angeles", "Katowice"]
    var citiesSubtitle = ["See New York from different perspective.", "Not only Palace of Culture and Science.", "The best taco in the wolrd.", "Let's see what city of Angels has to offer.", "City of mines."]

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
        
        return citiesName.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TourCell
        cell.thumbnailImageView.image = UIImage(named: citiesPhoto[indexPath.row])
        cell.tourTimeLabel.text = "5 tours"
        cell.titleLabel.text = citiesName[indexPath.row]
        cell.subTitle.text = citiesSubtitle[indexPath.row]
    
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width, height: frame.height / 2)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.selectedItem(city: citiesName[indexPath.row], photoName: citiesPhoto[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let newCell = cell as! TourCell
        newCell.alpha = 0
        newCell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            newCell.alpha = 1
            newCell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        })
    }
}


