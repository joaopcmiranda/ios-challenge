//
//  AggregateBank.swift
//  iOS Tests
//
//  Created by Joao Miranda on 22/12/20.
//

import Foundation

/// Simple structure that pretends to be a Bank in order to do the first card, preventing the need of having multiple implementations of the card
struct AggregateBank : Decodable, Hashable {
    static func build(_ banks: [Bank]) -> Bank {
        var accounts = Array<Account>()
        for bank in banks {
            accounts.append(Account(name: bank.name, income: bank.income, outcome: bank.outcome))
        }
        return Bank(name: "All accounts", logo: "", accounts: accounts, lastUpdated: Date())
    }
}
