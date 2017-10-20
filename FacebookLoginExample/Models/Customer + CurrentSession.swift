//
//  User + CurrentSession.swift
//  FacebookLoginExample
//
//  Created by Roxana Mitel on 20/10/2017.
//  Copyright © 2017 roxanamitel. All rights reserved.
//

struct Customer {
    var email: String?
}

class CurrentSession {
    static var customer: Customer?
    
    static func isLoggedIn() -> Bool {
        guard let customer = self.customer, customer.email != nil else {
            return false
        }
        return true
    }
  
}

