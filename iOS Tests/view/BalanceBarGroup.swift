//
//  BalanceBarGroup.swift
//  iOS Tests
//
//  Created by Joao Miranda on 21/12/20.
//

import SwiftUI

/// Aggregates banlance bars into a single bar with the ratio between income, outcome and total
struct BalanceBarGroup: View {
    
    private var income: Double
    private var outcome: Double
    private var total: Double
    
    init(income: Double, outcome: Double, total: Double) {
        self.income = income
        self.outcome = outcome
        self.total = total
    }
    
    var body: some View {
        
        GeometryReader { metrics in
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                if income+outcome != total {
                    BalanceBar(size: metrics.size.width){ // background gray bar in case this is a partial balance
                        Color(0xF1F1F1, opacity: 0.2)
                    }
                }
                HStack(spacing: 6) {
                    BalanceBar(size: metrics.size.width * CGFloat(outcome / total) - 3){ // Outcome bar
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(0xDA6545, opacity: 1),
                                Color(0xCD3849, opacity: 1)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing)
                    }
                    BalanceBar(size: metrics.size.width * CGFloat(income / total) - 3){ // Income bar
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(0x00A2DD, opacity: 1),
                                Color(0x09C4AE, opacity: 1)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing)
                    }
                }
            }.frame(width: metrics.size.width, height: 8, alignment: .center)
        }
    }
}

struct BalanceBarGroup_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing:20){
            BalanceBarGroup(income: 20, outcome: 40, total: 60)
            BalanceBarGroup(income: 30, outcome: 10, total: 40)
            BalanceBarGroup(income: 30, outcome: 40, total: 120)
        }
    }
}
