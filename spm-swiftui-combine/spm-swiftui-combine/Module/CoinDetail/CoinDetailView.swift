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
        VStack {
            KFImage(viewModel.coinImageUrl)
            VStack(alignment: .leading) {
                
                Text(viewModel.coin.name)
                    .font(.title)
                
                HStack(alignment: .top) {
                    Text(viewModel.coin.symbol)
                        .font(.subheadline)
                    Spacer()
                }
            }.padding()
            
            Spacer()
        }.onAppear {
            self.viewModel.coinAction()
        }.navigationBarTitle(Text(viewModel.coin.name), displayMode: .inline)
    }
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let coin = Coin(id: "1", symbol: "Test", name: "Test", image: CoinImage(thumb: "https://assets.coingecko.com/coins/images/863/large/0x.png?1547034672", small: "https://assets.coingecko.com/coins/images/863/large/0x.png?1547034672", large: "https://assets.coingecko.com/coins/images/863/large/0x.png?1547034672"))
        let coinDetailVM = CoinDetailViewModel(dependencies: dependencies, coin: coin)
        return CoinDetailView(viewModel: coinDetailVM)
    }
}
