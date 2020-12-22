//
//  ContentView.swift
//  iOS Tests
//
//  Created by Joao Miranda on 19/12/20.
//

import SwiftUI
import SwiftUIPager

/// Main menu of the app
struct MainView: View {
    var banks: [Bank] = BankService.fetchBanks()
    var items = Array(0..<3)
    @State var page: Int = 0
    var body: some View {
        
        NavigationView(){
            VStack (alignment: .center, spacing: 0){
                Pager (page: $page, // Used library for simplicity
                       data: items,
                       id: \.self
                ) {
                    self.page(index: $0)
                }
                .preferredItemSize(
                    CGSize(width: UIScreen.main.bounds.width - 60, height: 200),
                    alignment: .start
                )
                .itemSpacing(16)
                .pagingPriority(.high)
                .frame(width: UIScreen.main.bounds.width, height: 300)
                .navigationBarTitle("Home", displayMode: .large)
                PagerIndicator(3, index: $page)
                Spacer()
            }
        }
    }

    private func page(index: Int) -> some View{
        if index == 0 {
            let bank = AggregateBank.build(banks)
            return NavigationLink(
                destination:
                    
                    ExpandedBankCard(bank, aggregated: true)
                    .frame(
                        width: UIScreen.main.bounds.width - 40,
                        height: CGFloat(banks[index].accounts.count) * 205,
                        alignment: .center),
                
                label: {
                    BankCard(bank, aggregated: true) // First card containing all accounts aggregated
                }
            )
        } else {
            return NavigationLink( // Ideally this would be changed into a custom navigation to "morph" the small card into the expanded
                destination:
                    
                    ExpandedBankCard(banks[index - 1])
                    .frame(
                        width: UIScreen.main.bounds.width - 40,
                        height: CGFloat(banks[index - 1].accounts.count) * 205,
                        alignment: .center),
                
                label: {
                    BankCard(banks[index - 1]) // Remaining cards
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
