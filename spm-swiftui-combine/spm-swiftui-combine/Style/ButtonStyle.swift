//
//  ButtonStyle.swift
//  
//
//  Created by Tomas Holicky on 25/05/2020.
//

import SwiftUI

struct OutlineStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 44, minHeight: 44)
            .padding(.horizontal)
            .foregroundColor(Color.accentColor)
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.accentColor))
    }
}

struct FillStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 44, minHeight: 44)
            .padding(.horizontal)
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .background(Color.accentColor)
            .cornerRadius(8)
    }
}
