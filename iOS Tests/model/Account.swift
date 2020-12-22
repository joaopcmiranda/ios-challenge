//
//  Account.swift
//  iOS Tests
//
//  Created by Joao Miranda on 20/12/20.
//

import Foundation

/// Individual account. For this, only a static income/outcome values were used, normally there would be a transaction history where those would be inferred from
struct Account: Decodable, Hashable {
    let name: String
    let income: Double
    let outcome: Double
    
    var balance: Double {
        get{
            return income - outcome
        }
    }
}
