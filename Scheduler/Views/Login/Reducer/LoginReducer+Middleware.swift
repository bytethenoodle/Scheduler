//
//  LoginReducer+Middleware.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/18.
//  Copyright © 2020 mynt. All rights reserved.
//

import ReSwift
import CoreData

// MARK: - Middleware Methods

extension LoginReducer {
    
    func middleware() -> Middleware<ReducerStateType> {
        return { dispatch, getState in
            return { next in
                return { action in
                    
                    switch action {
                    case let loginAction as LoginAction:
                        
                        guard let errorState = self.errorStateForInput(username: loginAction.username,
                                                                       password: loginAction.password)
                        else {
                            // TODO: Handle async call here
                            next(LoginProcessAction(loginViewState: .login))
                            break
                        }
                        next(LoginProcessAction(loginViewState: errorState))
                        break
                    default:
                        next(action)
                        break
                    }
                }
            }
        }
    }
    
    func checkUser(username: String, password: String) {
        
    }
    
    func getUser(username: String, password: String) -> User? {
        let context = Persistence.persistentContainer.viewContext
        do {
            let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "username == %@ && password == %@", username, password)
            let fetchedResults = try context.fetch(fetchRequest)
            return fetchedResults.first
        }
        catch {
            return nil
        }
    }
}
