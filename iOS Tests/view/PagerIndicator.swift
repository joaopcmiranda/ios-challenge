//
//  PagerIndicator.swift
//  iOS Tests
//
//  Created by Joao Miranda on 22/12/20.
//

import SwiftUI

/// Indicator under the pager
struct PagerIndicator: View {
    @Binding var index: Int
    private var pages: Int
    
    init(_ pages: Int, index: Binding<Int>) {
        self.pages = pages
        self._index = index
    }
    var body: some View {
        HStack{
            ForEach((0..<pages)) { (page: Int) in
                if page == index {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(0x999999))
                        .frame(width: 24, height: 8)
                } else {
                    Circle()
                        .fill(Color(0x999999, opacity: 0.25))
                        .frame(width: 8, height: 8)
                }
            }
        }
    }
}

struct PagerIndicator_Previews: PreviewProvider {
    @State static var index = 3
    static var previews: some View {
        PagerIndicator(5, index: $index)
    }
}
