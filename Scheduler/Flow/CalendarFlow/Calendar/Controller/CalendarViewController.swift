//
//  CalendarViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

class CalendarViewController: ViewController<CalendarCoordinator,
                                             CalendarState>,
                              Storyboardable {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var monthLabel: PrimaryLabel?

    var collectionViewDataSource: CollectionViewDataSource<CalendarCollectionViewCell, Date?>?
    
    // MARK: - Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        setupCollectionViewLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewCoordinator?.store?.dispatch(CalendarRefreshAction())
    }
    
    // MARK: - View Setups
    
    func setupNavigationItems() {
        let leftBarButtonItem = UIBarButtonItem(title: "Logout",
                                                style: .plain,
                                                target: self,
                                                action: #selector(leftBarButtonItemTapped(_:)))
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    func setupCollectionViewLayout() {
        let columnLayout = CollectionViewColumnFlowLayout(
                cellsPerRow: 7,
                minimumInteritemSpacing: 0,
                minimumLineSpacing: 0,
                sectionInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        collectionView?.collectionViewLayout = columnLayout
        collectionView?.delegate = self
    }
    
    func setupDataSource(_ dates: [Date?]) {
        
        collectionViewDataSource =
            CollectionViewDataSource(models: dates) { cell, model in
                
                cell.setup(date: model)
                
                return cell
        }
        
        collectionView?.register(CalendarCollectionViewCell.self)
        collectionView?.dataSource = collectionViewDataSource
        collectionView?.reloadData()
    }
    
    // MARK: - View Actions
    
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

// MARK: - UICollectionViewDelegate

extension CalendarViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewCoordinator?.store?.dispatch(CalendarSelectAction(selectedIndex: indexPath.row))
    }
}

