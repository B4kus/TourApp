//
//  TourCell.swift
//  Tours
//
//  Created by Szymon Szysz on 24.06.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TourCell: BaseCell {
    
    let thumbnailImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
        
    }()
    
    let tourTimeLabel: UILabel = {
        let tourTime = UILabel()
        tourTime.backgroundColor = UIColor.red
        return tourTime
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Most iconic buldings"
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You will see the most iconic bulding of the city."
        label.textColor = UIColor.lightGray
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override func setupViews() {
        
        addSubview(thumbnailImageView)
        addSubview(tourTimeLabel)
        addSubview(titleLabel)
        addSubview(subTitle)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-|", views: thumbnailImageView, tourTimeLabel)
        addConstraintsWithFormat(format: "H:[v0(44)]-16-|", views: tourTimeLabel)
        
        addConstraint(.init(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(.init(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: tourTimeLabel, attribute: .left, multiplier: 1, constant: -8))
        addConstraint(.init(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: thumbnailImageView, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(.init(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        addConstraint(.init(item: subTitle, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(.init(item: subTitle, attribute: .right, relatedBy: .equal, toItem: tourTimeLabel, attribute: .left, multiplier: 1, constant: -8))
        addConstraint(.init(item: subTitle, attribute: .left, relatedBy: .equal, toItem: titleLabel, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(.init(item: subTitle, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        
    }
}
