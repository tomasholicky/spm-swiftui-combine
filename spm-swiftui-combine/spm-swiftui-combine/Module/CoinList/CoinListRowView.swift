//
//  CoinListRowView.swift
//  spm-swiftui-combine
//
//  Created by Tomas Holicky on 25/05/2020.
//  Copyright © 2020 Tomas Holicky. All rights reserved.
//

import SwiftUI
import NetworkCore

struct CoinListRowView: View {
    var coin: Coin
    
    var body: some View {
        HStack {
            Text(coin.name)
                .textStyle(Title())
            Spacer()
        }
    }
}

struct CoinListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinListRowView(coin: Coin(id: "1", symbol: "Test", name: "Test", image: nil))
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
