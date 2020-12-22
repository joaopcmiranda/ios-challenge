//
//  ExpandedBankCard.swift
//  iOS Tests
//
//  Created by Joao Miranda on 22/12/20.
//

import SwiftUI

/// Card expanded, this could, eventually be merged with BankCard and just have a @State flag for when it is expanded
struct ExpandedBankCard: View {
    private let bank: Bank
    private let aggregated: Bool // Defines if it is the first column as its color is different
    
    init(_ bank: Bank, aggregated: Bool = false) {
        self.bank = bank
        self.aggregated = aggregated
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    aggregated ?
                        LinearGradient(gradient: Gradient(colors: [
                                                            Color(0x023591),
                                                            Color(0x0385C2)]),
                                       startPoint: .bottomTrailing,
                                       endPoint: .topLeading)
                        : LinearGradient(gradient: Gradient(colors: [
                                                                Color(0xFFFFFF),
                                                                Color(0xEFEFEF)]),
                                         startPoint: .bottomTrailing,
                                         endPoint: .topLeading)
                )
                .shadow(color: Color(0x071d49, opacity: 0.15), radius: 20, x: 0, y: 11)
            VStack{
                // First row (Bank)
                BankCardRow(bank: bank, aggregated: aggregated)
                ForEach((0..<bank.accounts.count), id: \.self) {
                    
                    // Hairline
                    Rectangle()
                        .fill(aggregated ? Color(0xFFFFFF, opacity: 0.15) : Color(0x000000, opacity: 0.15))
                        .frame(height: 0.5, alignment: .center)
                    
                    // Accounts
                    BankCardRow(bank: bank, aggregated: aggregated, accountIndex: $0)
                        .navigationBarTitle(bank.name)
                }
            }
            .padding(16)
        }
    }
}

/// As it's only a UI implementation, testing was done on preview, for more complex flows it would be better to perform full UI tests
struct ExpandedBankCard_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedBankCard(Bank(name: "Test", logo: "can", accounts: [
            Account(name: "Main", income: 2000, outcome: 800),
            Account(name: "Ana", income: 1800, outcome: 1000)
        ], lastUpdated: Date()))
        .frame(width: UIScreen.main.bounds.width - 60, height: 200, alignment: .center)
    }
}
