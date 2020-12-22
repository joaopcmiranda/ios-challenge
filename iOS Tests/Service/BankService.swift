//
//  BankService.swift
//  iOS Tests
//
//  Created by Joao Miranda on 21/12/20.
//

import Foundation

/// Class responsible for fetching and parsing the Bank objects should be replaced with async architecture
class BankService {
    static func fetchBanks() -> [Bank] {
        return [
            Bank(name: "Westpac", logo: "westpac", accounts: [
                Account(name: "Choice", income: 300, outcome: 12),
                Account(name: "Savings", income: 112, outcome: 11)
            ], lastUpdated: Date()),
            Bank(name: "Commbank", logo: "can", accounts: [
                Account(name: "Main", income: 4000, outcome: 1222),
                Account(name: "Savings", income: 322, outcome: 311)
            ], lastUpdated: Date())
        ]
    }
}
