//
//  DetailViewController.swift
//  Tours
//
//  Created by Szymon Szysz on 27.06.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import UserNotifications

class DetailViewController: UIViewController, MKMapViewDelegate {
    
   
    let detailView = DetailView()
    let fullView: CGFloat = 100
    var partialView: CGFloat {
        return UIScreen.main.bounds.height - 150
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        detailView.mapView.delegate = self
    
        detailView.setUpView(view: view)
        
        
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(DetailViewController.panGesture))
        detailView.textView.addGestureRecognizer(gesture)
        detailView.animation()
        
    }

    @objc func panGesture(recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: detailView.textView)
        let velocity = recognizer.velocity(in: detailView.textView)
        let y = detailView.textView.frame.minY
        if (y + translation.y >= fullView) && (y + translation.y <= partialView) {
            detailView.textView.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
            recognizer.setTranslation(CGPoint.zero, in: detailView.textView)
            
        }
        
        if recognizer.state == .ended {
            var duration =  velocity.y < 0 ? Double((y - fullView) / -velocity.y) : Double((partialView - y) / velocity.y )
            
            duration = duration > 1.3 ? 1 : duration
            
            UIView.animate(withDuration: duration, delay: 0.0, options: [.allowUserInteraction], animations: {
                if  velocity.y >= 0 {
                    self.detailView.textView.frame = CGRect(x: 0, y: self.partialView, width: self.view.frame.width, height: self.view.frame.height)
                } else {
                    self.detailView.textView.frame = CGRect(x: 0, y: self.fullView, width: self.view.frame.width, height: self.view.frame.height)
                }
                
            }, completion: { [weak text = detailView] _ in
                if ( velocity.y < 0 ) {
                    text?.textViewInfo.isScrollEnabled = true

                }
            })
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = systemBlueColor
        navigationController?.view.backgroundColor = .white
        //navigationController?.navigationItem.backBarButtonItem?.tintColor = systemBlueColor
        navigationController?.navigationItem.leftBarButtonItem?.tintColor = systemBlueColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.hideTransparentNavigationBar()
    }

}

