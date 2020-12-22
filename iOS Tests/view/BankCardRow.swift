//
//  BankCardRow.swift
//  iOS Tests
//
//  Created by Joao Miranda on 21/12/20.
//

import SwiftUI

/// This is the contents of the cards, as they are composed of repeating rows.
struct BankCardRow: View {
    let bank : Bank
    let accountIndex : Int
    private let aggregated: Bool
    
    init(bank: Bank, aggregated: Bool = false, accountIndex: Int = -1) {
        self.bank = bank
        self.accountIndex = accountIndex
        self.aggregated = aggregated
    }
    
    var body: some View {
        VStack ( spacing: 0){
            HStack{
                HStack{
                    if(accountIndex == -1 && !aggregated){
                        Image(bank.logo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    
                    Text(accountIndex == -1 ? bank.name : bank.accounts[accountIndex].name)
                        .foregroundColor(aggregated ? Color(0xFFFFFF, opacity: 0.75) : Color(0x333333))
                        .font(.system(size: 14, weight: .bold))
                    
                }
                
                Spacer()
                
                if(accountIndex == -1 || (aggregated && accountIndex != -1)){
                    HStack{
                        
                        Image("reset")
                            .resizable()
                            .frame(width: 10, height: 10)
                        
                        // In full implementations, this would be based on the Bank::lastUpdated
                        Text("Just now")
                            .foregroundColor(aggregated ? Color(0xFFFFFF, opacity: 0.75) : Color(0x999999))
                            .font(.system(size: 12, weight: .medium))
                        
                    }
                }
            }.frame( height: 42, alignment: .top)
            
            HStack{
                
                Text("$\(Int(accountIndex == -1 ? bank.balance : bank.accounts[accountIndex].balance))")
                    .foregroundColor(aggregated ? Color(0xFFFFFF) : Color(0x333333))
                    .font(.system(size: 24, weight: .bold))
                
                Text("Available Balance")
                    .foregroundColor(aggregated ? Color(0xFFFFFF, opacity: 0.75) : Color(0x666666))
                    .font(.system(size: 14, weight: .regular))
                
                Spacer()
                
            }.frame( height: 52, alignment: .top)
            
            HStack{
                
                BalanceBarGroup(
                    income: accountIndex == -1 ? bank.income : bank.accounts[accountIndex].income,
                    outcome: accountIndex == -1 ? bank.outcome : bank.accounts[accountIndex].outcome,
                    total: bank.income + bank.outcome)
                    .frame(maxHeight: 8, alignment: .center)
                
            }.frame(height: 36, alignment: .top)
            
            HStack{
                HStack(spacing: 4){
                    
                    if accountIndex == -1{
                        Circle()
                            .fill(Color(0xCC334A))
                            .frame(width: 8, height: 8, alignment: .center)
                    }
                    
                    Text("$\(Int(accountIndex == -1 ? bank.outcome : bank.accounts[accountIndex].outcome))")
                        .foregroundColor(aggregated ? Color(0xFFFFFF) : Color(0x333333))
                        .font(.system(size: 14, weight: .bold))
                    
                    Text("Spent")
                        .foregroundColor(aggregated ? Color(0xFFFFFF) : Color(0x333333))
                        .font(.system(size: 14, weight: .regular))
                    
                }
                
                Spacer()
                
                HStack(spacing: 4){
                    
                    if accountIndex == -1{
                        Circle()
                            .fill(Color(0x08C4AE))
                            .frame(width: 8, height: 8, alignment: .center)
                    }
                    
                    Text("$\(Int(accountIndex == -1 ? bank.income : bank.accounts[accountIndex].income))")
                        .foregroundColor(aggregated ? Color(0xFFFFFF) : Color(0x333333))
                        .font(.system(size: 14, weight: .bold))
                    
                    Text("Income")
                        .foregroundColor(aggregated ? Color(0xFFFFFF) : Color(0x333333))
                        .font(.system(size: 14, weight: .regular))
                    
                }
                
            }.frame(height: 32, alignment: .top)
        }
    }
}

struct BankCardRow_Previews: PreviewProvider {
    static let bank = Bank(name: "Test", logo: "can", accounts: [
        Account(name: "Main", income: 2000, outcome: 800),
        Account(name: "Ana", income: 1800, outcome: 1000),
        Account(name: "Bana", income: 3000, outcome: 2800)
    ], lastUpdated: Date())
    static var previews: some View {
        VStack{
            BankCardRow(bank: bank)
            BankCardRow(bank: bank, accountIndex: 0)
            Rectangle().fill(Color(0x000000, opacity: 0.15)).frame(height: 0.5, alignment: .center)
            BankCardRow(bank: bank, accountIndex: 1)
            Rectangle().fill(Color(0x000000, opacity: 0.15)).frame(height: 0.5, alignment: .center)
            BankCardRow(bank: bank, accountIndex: 2)
        }
    }
}
