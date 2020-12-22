//
//  ColorExtension.swift
//  iOS Tests
//
//  Created by Joao Miranda on 21/12/20.
//

import SwiftUI

/// Helper function to allow Hex Color usage
extension Color {
    init(_ hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff)) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}