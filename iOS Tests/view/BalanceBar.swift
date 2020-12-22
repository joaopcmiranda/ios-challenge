//
//  BalanceBar.swift
//  iOS Tests
//
//  Created by Joao Miranda on 21/12/20.
//

import SwiftUI

/// Bars showing the income/outcome, these are aggregated by the BalanceBarGroup class
struct BalanceBar<Content: View>:View {
    
    private var size: CGFloat
    private var content: Content
    
    init(size: CGFloat, @ViewBuilder content: @escaping () -> Content) {
        self.size = max(size, 0) // Avoid negative balance
        self.content = content()
    }
    
    var body: some View {
        ZStack{
            content
        }.clipShape(RoundedRectangle(cornerRadius: 8.0))
        .frame(width: CGFloat(size), height: 8, alignment: .center)
    }
}

struct BalanceBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 20.0){
            BalanceBar(size: 20.0){
                Color.red
            }
            BalanceBar(size: 100.0){
                Color.red
            }
            BalanceBar(size: 120.0){
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
            }
        }
    }
}
