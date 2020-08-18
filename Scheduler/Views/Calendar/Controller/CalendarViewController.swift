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
    @IBOutlet weak var monthLabel: PrimaryLabel?

    var collectionViewDataSource: CollectionViewDataSource<CalendarCollectionViewCell, Date?>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        setupCollectionViewLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewCoordinator?.store?.dispatch(CalendarAction())
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
    
    @IBAction func leftButtonTapped(_ sender: Any?) {
        viewCoordinator?.store?.dispatch(CalendarDecrementAction())
    }
    
    @IBAction func rightButtonTapped(_ sender: Any?) {
        viewCoordinator?.store?.dispatch(CalendarIncrementAction())
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.reloadData()
    }
}

extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 7.0,
                      height: view.frame.width / 7.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewCoordinator?.store?.dispatch(CalendarSelectAction(selectedIndex: indexPath.row))
    }
}
