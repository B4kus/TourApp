//
//  ViewController.swift
//  Tours
//
//  Created by Szymon Szysz on 17.06.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        navigationItem.title = "Tours"
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView?.backgroundColor = .white
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "feed")
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feed", for: indexPath)
        
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width - 25 , height: 226)
    }
    

}

