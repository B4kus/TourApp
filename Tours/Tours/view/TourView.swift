//
//  TourView.swift
//  Tours
//
//  Created by Szymon Szysz on 02.07.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import UIKit


protocol CollectionCellDelegateSelected {
    func selectedItem()
    
}

class TourView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    var delegate: CollectionCellDelegateSelected?
   
    
    let cellId = "cellID"
    
    var tourPhotos = ["Plik00001.jpg","Plik00002.jpg","Plik00003.jpg","Plik00004.jpg","Plik00005.jpg"]
    var tourNames = ["Night time", "Most iconic buldings", "Food steps", "Rooftops", "Green way"]
    
    lazy var viewtest: UIView = {
        
        let view = UIView()
        return view
        
    }()

    let cityPhoto: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Plik00003.jpg")
        return image
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Katowice"
        label.font = systemBoldFont(size: 24)
        label.isHidden = true
        label.textAlignment = .center
        return label
    }()
    
    let cityInfo: UITextView = {
        
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.text = "The City of New York, often called New York City (NYC) or simply New York, is the most populous city in the United States.With an estimated 2017 population of 8,622,698 distributed over a land area of about 302.6 square miles (784 km2),New York City is also the most densely populated major city in the United States.Located at the southern tip of the state of New York, the city is the center of the New York metropolitan area, the largest metropolitan area in the world by urban landmass and one of the world's most populous megacities, with an estimated 20,320,876 people in its 2017 Metropolitan Statistical Area and 23,876,155 residents in its Combined Statistical Area. A global power city, New York City has been described as the cultural, financial, and media capital of the world, and exerts a significant impact upon commerce,entertainment, research, technology, education, politics, tourism, and sports. The city's fast pace defines the term New York minute. Home to the headquarters of the United Nations,New York is an important center for international diplomacy."
        textView.font = systemThinFont(size: 18)
        textView.isHidden = true
        textView.isEditable = false
        textView.isUserInteractionEnabled = true
        textView.isSelectable = false
        return textView
        
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.translatesAutoresizingMaskIntoConstraints = false
        if let flowlayout = cv.collectionViewLayout as? UICollectionViewFlowLayout {
            
            flowlayout.scrollDirection = .horizontal
            flowlayout.minimumLineSpacing = 0
        }
        cv.delegate = self
        cv.dataSource = self
        return cv
        
    }()
    
  
    
    func setupViews(view: UIView) {
        
        
        collectionView.register(ToursCell.self, forCellWithReuseIdentifier: cellId)
      
        
        view.addSubview(viewtest)
        view.addSubview(collectionView)
        
        viewtest.addSubview(cityPhoto)
        viewtest.addSubview(cityInfo)
        viewtest.addSubview(title)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: viewtest)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        view.addConstraintsWithFormat(format: "V:|[v0(\(view.frame.height / 3))][v1]-25-|", views: viewtest, collectionView)
        viewtest.addConstraintsWithFormat(format: "H:|[v0]|", views: cityPhoto)
        viewtest.addConstraintsWithFormat(format: "V:|[v0]|", views: cityPhoto)
        viewtest.addConstraintsWithFormat(format: "H:|[v0]|", views: cityInfo)
        viewtest.addConstraintsWithFormat(format: "H:|[v0]|", views: title)
        viewtest.addConstraintsWithFormat(format: "V:|-50-[v0(40)][v1]|", views: title,cityInfo)
        

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tourPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ToursCell
        cell.thumbnailImageView.image = UIImage(named: tourPhotos[indexPath.row])
        cell.titleLabel.text = tourNames[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: 250, height: collectionView.frame.size.height / 2.2)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.selectedItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let newCell = cell as! ToursCell
        newCell.alpha = 0
        newCell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            newCell.alpha = 1
            newCell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        })
    }
    
}


