//
//  ViewController.swift
//  Tours
//
//  Created by Szymon Szysz on 17.06.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout, CollectionCellDelegate {
 
 

    let cellId = "cellId"
    let popularCellId = "popularId"
    let trendingCellId = "trendingId"
    let feedCell = FeedCell()
    let contentInsert: CGFloat = 65
    var dumyData = [Tour]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupCollectionView()
        setupMenuBar()
        setupNaviagtionTitle()
        feedCell.collectionView.delegate = self
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barStyle = .default
        
    }
    
    func setupNaviagtionTitle() {
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - (view.frame.width / 14), height: view.frame.height))
        titleLabel.text = "Tours"
        titleLabel.textColor = .black
        titleLabel.font = systemBoldFont(size: 32)
        
        navigationItem.titleView = titleLabel
        
        
    }
    
    func selectedItem(city: String, photoName: String) {
        let view = ToursViewController()
        view.setUpWithData(city: city, photo: photoName)
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    

    func setupCollectionView() {
        
        collectionView?.backgroundColor = .white
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(PopularCell.self, forCellWithReuseIdentifier: popularCellId)
        collectionView?.register(TrendingCell.self, forCellWithReuseIdentifier: trendingCellId)

        if let flowlayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            
            flowlayout.scrollDirection = .horizontal
            flowlayout.minimumLineSpacing = 0
            
        }
        
        collectionView?.isPagingEnabled = true
        collectionView?.contentInset = UIEdgeInsets(top: contentInsert, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: contentInsert, left: 0, bottom: 0, right: 0)
        
    }

    lazy var menuBar: MenuBar = {
        
        let mb = MenuBar()
        mb.homeController = self
        return mb
        
    }()
    
    private func setupMenuBar() {
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|-\(view.frame.width / 28)-[v0]-\(view.frame.width / 28)-|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
        
    }
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: [], animated: true)
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier: String
        if indexPath.item == 1 {
            
            identifier = popularCellId
            
        } else if indexPath.item == 2{
            
            identifier = popularCellId
            
        } else {
            
            identifier = cellId
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FeedCell
        cell.delegate = self
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // TO DO: Wyliczycz wartosc 3.23 - watosc scroll 
        menuBar.horizontalBarLeftAnchorConstraints?.constant = scrollView.contentOffset.x  / 4.27
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height:view.frame.height - contentInsert)
    }
    
 
}

