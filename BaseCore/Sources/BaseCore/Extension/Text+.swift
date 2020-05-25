//
//  Text+.swift
//  spm-swiftui-combine
//
//  Created by Tomas Holicky on 25/05/2020.
//  Copyright © 2020 Tomas Holicky. All rights reserved.
//

import SwiftUI

extension Text {
    public func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
