//
//  MenuBar.swift
//  Tours
//
//  Created by Szymon Szysz on 22.06.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var homeController: HomeController?
    var horizontalBarLeftAnchorConstraints: NSLayoutConstraint?
    let titleName = ["Featured", "Popluar", "Trending"]
    
    lazy var collectonView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        return cv
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectonView.register(MenuCell.self, forCellWithReuseIdentifier: "title")
        addSubview(collectonView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectonView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectonView)
        
        let selectedInedxPath = IndexPath(item: 0, section: 0)
        collectonView.selectItem(at: selectedInedxPath, animated: false, scrollPosition: [])
        
        setupHorizontalBar()
        
    }
    
    func setupHorizontalBar() {
        
        let horizontalBar = UIView()
        horizontalBar.backgroundColor = UIColor(red:0.31, green:0.63, blue:0.85, alpha:1.00)
        horizontalBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBar)
        
        horizontalBarLeftAnchorConstraints = horizontalBar.leftAnchor.constraintEqualToSystemSpacingAfter(self.leftAnchor, multiplier: 1)
        horizontalBarLeftAnchorConstraints?.isActive = true
        
        horizontalBar.bottomAnchor.constraintEqualToSystemSpacingBelow(self.bottomAnchor, multiplier: 0).isActive = true
        horizontalBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBar.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
    }
  
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        homeController?.scrollToMenuIndex(menuIndex: indexPath.item)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectonView.dequeueReusableCell(withReuseIdentifier: "title", for: indexPath) as! MenuCell
        cell.titleLabel.text = titleName[indexPath.item]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width / 4, height: frame.height)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuCell: BaseCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(titleLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: titleLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: titleLabel)

    }
}
