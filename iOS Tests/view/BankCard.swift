//
//  BankCard.swift
//  iOS Tests
//
//  Created by Joao Miranda on 20/12/20.
//

import SwiftUI

/// Small reduced size card
struct BankCard: View {
    private let bank: Bank
    private let aggregated: Bool
    
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
                BankCardRow(bank: bank, aggregated: aggregated)
            }
            .padding(16)
        }
    }
}


struct BankCard_Previews: PreviewProvider {
    static var previews: some View {
        BankCard(Bank(name: "Test", logo: "can", accounts: [
            Account(name: "Main", income: 2000, outcome: 800),
            Account(name: "Ana", income: 1800, outcome: 1000),
            Account(name: "Bana", income: 3000, outcome: 2800)
        ], lastUpdated: Date()))
        .frame(width: UIScreen.main.bounds.width - 60, height: 200, alignment: .center)
    }
}
