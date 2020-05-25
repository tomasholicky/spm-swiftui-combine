//
//  TextStyle.swift
//  
//
//  Created by Tomas Holicky on 25/05/2020.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .lineSpacing(6)
            .foregroundColor(.primary)
    }
}

struct Subtitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .lineSpacing(4)
            .foregroundColor(.secondary)
    }
}


