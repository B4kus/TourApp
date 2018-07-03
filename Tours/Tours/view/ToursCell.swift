//
//  ToursCell.swift
//  Tours
//
//  Created by Szymon Szysz on 03.07.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import UIKit


class ToursCell: BaseCell {
    
    
    
    let shadowView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.6
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
        return view
    }()
    
    let thumbnailImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        return imageView
        
    }()
    
    let tourTimeLabel: UILabel = {
        let tourTime = UILabel()
        tourTime.text = "2 hours"
        tourTime.textAlignment = .center
        tourTime.font = systemThinFont(size: 14)
        return tourTime
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Most iconic buldings"
        label.font = systemBoldFont(size: 18)
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "You will see the most iconic bulding of the city."
        label.adjustsFontSizeToFitWidth = true
        label.font = systemThinFont(size: 16)
        return label
    }()
    
    
    
    override func setupViews() {
        
        shadowView.addSubview(thumbnailImageView)
        addSubview(shadowView)
        addSubview(tourTimeLabel)
        addSubview(titleLabel)
        addSubview(subTitle)
        
        addConstraintsWithFormat(format: "H:|-\(self.frame.width / 28)-[v0]-\(self.frame.width / 28)-|", views: shadowView)
        addConstraintsWithFormat(format: "V:|-\(self.frame.width / 28)-[v0]-8-[v1(44)]-\(self.frame.width / 28)-|", views: shadowView, tourTimeLabel)
        addConstraintsWithFormat(format: "H:[v0(44)]-\(self.frame.width / 28)-|", views: tourTimeLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: thumbnailImageView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: thumbnailImageView)
        
        addConstraint(.init(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: shadowView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(.init(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: tourTimeLabel, attribute: .left, multiplier: 1, constant: -8))
        addConstraint(.init(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: shadowView, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(.init(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        addConstraint(.init(item: subTitle, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(.init(item: subTitle, attribute: .right, relatedBy: .equal, toItem: tourTimeLabel, attribute: .left, multiplier: 1, constant: -8))
        addConstraint(.init(item: subTitle, attribute: .left, relatedBy: .equal, toItem: titleLabel, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(.init(item: subTitle, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
    }
    
    
    
    
    
}
