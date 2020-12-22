//
//  Bank.swift
//  iOS Tests
//
//  Created by Joao Miranda on 20/12/20.
//

import Foundation

/// Responsible for holding the accounts and providing data regarding their balance
struct Bank: Decodable, Hashable {
    let name: String
    let logo: String
    let accounts: Array<Account>
    let lastUpdated: Date
    
    
    var income: Double {
        get {
            var sum = 0.0
            for account in accounts{
                sum += account.income
            }
            return sum
        }
    }
    
    var outcome: Double {
        get {
            var sum = 0.0
            for account in accounts{
                sum += account.outcome
            }
            return sum
        }
    }
    
    var balance: Double {
        get {
            return income - outcome
        }
    }
}
