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
    let headerID = "Header"
    var citys = ["Plik00001.jpg","Plik00002.jpg","Plik00003.jpg","Plik00004.jpg","Plik00005.jpg"]
    
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
        textView.text = "Można zaryzykować stwierdzenie, że Belgowie mają teraz najmocniejszy zespół w XXI wieku. Wielu z Czerwonych Diabłów od lat gra w najlepszych europejskich klubach, mimo to w kadrze nie potrafili do siebie dotrzeć – prędzej czy później drużyna rozczarowywała na wielkich turniejach. Belgom przylgnęła łatka czarnego koniamistrzostw Europy i świata, jednak nic z tego nie wynikało. Wydaje się, że w Rosji doszło do przełamania, bo Czerwone Diabły wreszcie grają tak, jak oczekują kibice. Widowiskowo, skutecznie i pewnie.W efekcie w grupie F byli najlepsi, wygrywając z każdym. Także z Anglikami, choć Gareth Southgate nie skorzystał z wielu zawodników pierwszego wyboru. W znakomitej formie jest Romelu Lukaku, który w fazie grupowej strzelił cztery gole."
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
        view.addConstraintsWithFormat(format: "V:|[v0(\(view.frame.height / 3))][v1]|", views: viewtest, collectionView)
        viewtest.addConstraintsWithFormat(format: "H:|[v0]|", views: cityPhoto)
        viewtest.addConstraintsWithFormat(format: "V:|[v0]|", views: cityPhoto)
        viewtest.addConstraintsWithFormat(format: "H:|[v0]|", views: cityInfo)
        viewtest.addConstraintsWithFormat(format: "H:|[v0]|", views: title)
        viewtest.addConstraintsWithFormat(format: "V:|-50-[v0(40)][v1]|", views: title,cityInfo)
        

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ToursCell
        cell.thumbnailImageView.image = UIImage(named: citys[indexPath.row])
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
    
}


