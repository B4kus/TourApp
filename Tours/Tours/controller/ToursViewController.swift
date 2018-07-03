//
//  ToursViewController.swift
//  Tours
//
//  Created by Szymon Szysz on 02.07.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import UIKit

class ToursViewController: UIViewController, CollectionCellDelegateSelected {
    
    
    func selectedItem() {
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    

    
    let tourView = TourView()
    var isOpen = false
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //tourView.setupViews(view: view)
        let tap = UITapGestureRecognizer(target: self, action: #selector(ToursViewController.flip))
        tourView.viewtest.addGestureRecognizer(tap)
        tourView.delegate = self

        
    }


    override func viewWillLayoutSubviews() {
        
        tourView.setupViews(view: view)
        
    }
    
    
    

    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = systemBlueColor
        navigationController?.view.backgroundColor = .white
        navigationController?.navigationItem.leftBarButtonItem?.tintColor = systemBlueColor
    }
    
    @objc func flip(recognizer: UITapGestureRecognizer) {
        if isOpen {
            
            isOpen = false
            tourView.cityPhoto.isHidden = false
            tourView.cityInfo.isHidden = true
            tourView.title.isHidden = true
            print("tap")
            UIView.transition(with: tourView.viewtest, duration: 0.4, options: .transitionFlipFromRight, animations: nil, completion: nil)
            navigationController?.navigationBar.tintColor = systemBlueColor
            
            
        } else {
            
            isOpen = true
            navigationController?.navigationBar.tintColor = systemBlueColor
            tourView.cityPhoto.isHidden = true
            tourView.cityInfo.isHidden = false
            tourView.title.isHidden = false
            UIView.transition(with: tourView.viewtest, duration: 0.4, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            print("Top tap")
            print(isOpen)
      
        }
        
        
    }

    
    
}
