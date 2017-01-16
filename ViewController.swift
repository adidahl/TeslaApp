//
//  ViewController.swift
//  TeslaApp
//
//  Created by Adnan Ribic on 11/01/2017.
//  Copyright © 2017 Adnan Ribic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        
        return cv
    }()
    
    let cellId = "cellId"
    
    let pages : [Pages] = {
        let firstPage = Pages(title: "Welcome", message: "Welcome to Tesla Mobile Key unofficial iPad app for controlling, testing and observing your Tesla car. You can only use this app if you already have an account provided by Tesla Motors. For more information visit https://www.tesla.com/user ", imageName: "TeslaImage1")
        let secondPage = Pages(title: "Unofficial app", message: "This app is using unofficial API. There maybe some changes in the future, so sometimes some functions from this app will not work until app is updated. So please keep the app updated.", imageName: "models_interior-medium")
        let thirdPage = Pages(title: "Rich functionalities", message: " With this app, owners can: Check charging progress in real time and start or stop charge; Heat or cool your car before driving — even if it's in a garage; Locate your car with directions or track its movement across a map; Flash lights or honk the horn to find your car when parked; Vent or close the panoramic roof; Lock or unlock from afar and many more.", imageName: "maxresdefault")
        return [firstPage, secondPage, thirdPage]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }


}

