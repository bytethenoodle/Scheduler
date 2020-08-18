//
//  CalendarViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

import UIKit

class CalendarViewController: ViewController<CalendarCoordinator,
                                             CalendarState>,
                              Storyboardable {
    
    @IBOutlet weak var collectionView: UICollectionView?
    
    var collectionViewDataSource: CollectionViewDataSource<CalendarCollectionViewCell, Date?>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        setupCollectionViewLayout()
    }
    
    func setupNavigationItems() {
        let leftBarButtonItem = UIBarButtonItem(title: "Logout",
                                                style: .plain,
                                                target: self,
                                                action: #selector(leftBarButtonItemTapped(_:)))
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    func setupCollectionViewLayout() {
        collectionView?.delegate = self
    }
    
    @objc func leftBarButtonItemTapped(_ sender: Any?) {
        viewCoordinator?.store?.dispatch(CalendarLogoutAction())
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.reloadData()
    }
}

extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 7.0,
                      height: view.frame.height / 7.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
