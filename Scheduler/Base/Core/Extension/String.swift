//
//  String.swift
//  Scheduler
//
//  Created by Elbert John Orozco on 2020/08/17.
//  Copyright © 2020 mynt. All rights reserved.
//

import Foundation

extension String {
    
    static let empty: String = ""
    static let space: String = " "
    
    func isEmpty() -> Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines) == String.empty
    }
    
    func hasUpperLetter() -> Bool {
        guard let regex = try? NSRegularExpression(pattern: "[A-Z]", options: []) else {
            return false }
        let matches = regex.matches(in: self,
                                    options: NSRegularExpression.MatchingOptions(),
                                    range: NSRange(location: 0, length: count))
        return !matches.isEmpty
    }

    func hasLowerLetter() -> Bool {
        guard let regex = try? NSRegularExpression(pattern: "[a-z]", options: []) else {
            return false }
        let matches = regex.matches(in: self,
                                    options: NSRegularExpression.MatchingOptions(),
                                    range: NSRange(location: 0, length: count))
        return !matches.isEmpty
    }
    
    func isAlphanumeric() -> Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    func hasNoSpace() -> Bool {
        return (rangeOfCharacter(from: .whitespacesAndNewlines) == nil)
    }
    
    func isValidUsernameRange() -> Bool {
        return count >= 8 && count <= 20
    }
    
    func isValidPasswordRange() -> Bool {
        return count >= 8
    }
}
