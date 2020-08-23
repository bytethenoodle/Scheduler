//
//  ViewCoordinator.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/14.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift

protocol ViewCoordinator: Coordinator {
    
    associatedtype FlowCoordinatorType: FlowCoordinator
    associatedtype ViewControllerType: ViewControllerCoordinatable
    
    var flowCoordinator: FlowCoordinatorType? {get set}
    
    var viewController: ViewControllerType? {get set}
    
    init(flowCoordinator: FlowCoordinatorType)
    
    func start()
}

extension ViewCoordinator {
    
    func showAlertWithField(title: String? = nil,
                            meesage: String? = nil,
                            fieldPlaceholder: String? = nil,
                            fieldText: String? = nil,
                            actions: @escaping (_ alert: UIAlertController, _ field: UITextField?) -> [UIAlertAction]) {
        guard let topViewController = viewController?.topViewController() else {return}
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        alert.title = title
        alert.message = meesage

        alert.addTextField { (field) in
            field.placeholder = fieldPlaceholder
            field.text = fieldText
        }
        
        for action in actions(alert, alert.textFields?.first) {
            alert.addAction(action)
        }
        
        topViewController.present(alert, animated: true, completion: nil)
    }
    
    
}
