//
//  Extensions.swift
//  Tours
//
//  Created by Szymon Szysz on 24.06.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import UIKit

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
            
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UINavigationController {
    
    public func presentTransparentNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.view.backgroundColor = .white
    }
    
    public func hideTransparentNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.view.backgroundColor = .white
    }
}

extension HomeController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
