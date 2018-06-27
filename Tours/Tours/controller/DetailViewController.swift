//
//  DetailViewController.swift
//  Tours
//
//  Created by Szymon Szysz on 27.06.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.view.backgroundColor = .white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.view.backgroundColor = .white
    }
    
    
    let mapView: MKMapView = {
        
        let view = MKMapView()
        view.backgroundColor = .red
        return view
        
    }()
    
    let textView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    let routeLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Route information "
        
        return label
    }()
    
    let infoLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Duration: 2 hours"
        
        return label
    }()
    
    let line: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
        
    }()
    
    let lineTwo: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
        
    }()
    
    let lineThree: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
        
    }()
    
    let startButton: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .red
        return button
        
    }()
    
    let textViewInfo: UITextView = {
        
        let textView = UITextView()
        textView.text = "If you really enjoy spending your vacation ‘on water’ or would like to try something new and exciting for the first time, then you can consider a houseboat vacation. There are so many fun things to do and so many great landscapes to see on a houseboat vacation! But before making further plans, let’s take a look at sa options that you have for a low-cost vacation on water: you could rent a houseboat this year and try out an altogether exotic kind of vacation this year, or you could indulge in a houseboat timeshare. What is a houseboat timeshare? Most people who have used a houseboat timeshare say that it is a great way to spend your vacation at a very high-quality resort, in a place where you couldn’t get reservations so easily that too at a very low price! Doesn’t that sound great? But let’s see how and why houseboat timeshares can offer you with such fabulous opportunities of low-cost vacationing on water."
        textView.backgroundColor = .clear
        
        return textView
    }()
    
    func setUpView() {
        view.addSubview(mapView)
        view.addSubview(textView)
        textView.addSubview(routeLabel)
        textView.addSubview(line)
        textView.addSubview(infoLabel)
        textView.addSubview(lineTwo)
        textView.addSubview(lineThree)
        textView.addSubview(startButton)
        textView.addSubview(textViewInfo)
        
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: mapView)
        view.addConstraintsWithFormat(format: "V:|[v0]-\(view.frame.height / 3)-|", views: mapView)
        view.addConstraintsWithFormat(format: "H:|-32-[v0]-32-|", views: textView)
        view.addConstraintsWithFormat(format: "V:|-\(view.frame.height / 2)-[v0]-22-|", views: textView)
        textView.addConstraintsWithFormat(format: "H:|-14-[v0]-14-|", views: routeLabel)
        textView.addConstraintsWithFormat(format: "H:|-14-[v0]-14-|", views: line)
        textView.addConstraintsWithFormat(format: "H:|-14-[v0]-14-|", views: infoLabel)
        textView.addConstraintsWithFormat(format: "H:|-14-[v0]-14-|", views: lineTwo)
        textView.addConstraintsWithFormat(format: "H:|-14-[v0]-14-|", views: lineThree)
        textView.addConstraintsWithFormat(format: "H:|-14-[v0]-14-|", views: startButton)
        textView.addConstraintsWithFormat(format: "H:|-14-[v0]-14-|", views: textViewInfo)
        textView.addConstraintsWithFormat(format: "V:|[v0(30)]-5-[v1(2)]-5-[v2(30)]-5-[v3(2)]-5-[v4(30)]-5-[v5(2)]-5-[v6]-10-|", views: routeLabel,line, infoLabel, lineTwo, startButton, lineThree, textViewInfo)
  
    }
}
