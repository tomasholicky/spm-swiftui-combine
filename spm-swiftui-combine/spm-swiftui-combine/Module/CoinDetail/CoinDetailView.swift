//
//  CoinDetailView.swift
//  spm-swiftui-combine
//
//  Created by Tomas Holicky on 14/05/2020.
//  Copyright © 2020 Tomas Holicky. All rights reserved.
//

import SwiftUI
import NetworkCore
import KingfisherSwiftUI

struct CoinDetailView: View {
    @ObservedObject var viewModel: CoinDetailViewModel
    
    init(viewModel: CoinDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            KFImage(viewModel.coinImageUrl)
                .frame(width: 200, height: 200, alignment: .center)
                .padding(50)
            VStack(alignment: .center, spacing: 8) {
                Text(viewModel.coin.name)
                    .textStyle(Title())
                Text(viewModel.coin.symbol)
                    .textStyle(Subtitle())
            }
            Spacer()
        }
        .onAppear(perform: viewModel.coinAction)
        .navigationBarTitle(Text(viewModel.coin.name), displayMode: .inline)
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let coin = Coin(id: "1", symbol: "Test", name: "Test", image: CoinImage(thumb: "", small: "", large: "https://assets.coingecko.com/coins/images/863/large/0x.png?1547034672"))
        let coinDetailVM = CoinDetailViewModel(dependencies: dependencies, coin: coin)
        return CoinDetailView(viewModel: coinDetailVM)
    }
}
