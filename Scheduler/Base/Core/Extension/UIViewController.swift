//
//  UIViewController.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/23.
//  Copyright © 2020 mynt. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func topViewController() -> UIViewController? {
        
        if let navigationController = self as? UINavigationController,
            !navigationController.viewControllers.isEmpty
        {
            return navigationController.viewControllers.last?.topViewController()
            
        } else if let tabBarController = self as? UITabBarController,
            let selectedController = tabBarController.selectedViewController
        {
            return selectedController.topViewController()
            
        } else if let presentedController = presentedViewController {
            return presentedController.topViewController()
        }
        
        return self
    }
    
    func showAlertWithTextField(title: String?,
                                message: String?,
                                actions: [UIAlertAction],
                                textFieldSetup: @escaping (_ textField: UITextField) -> Void) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        alert.title = title
        alert.message = message

        alert.addTextField { (textField) in
            textFieldSetup(textField)
        }
                
        for action in actions {
            alert.addAction(action)
        }
        
        present(alert, animated: true, completion: nil)
    }
}
