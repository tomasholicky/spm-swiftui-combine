//
//  CoinListView.swift
//  spm-swiftui-combine
//
//  Created by Tomas Holicky on 25/05/2020.
//  Copyright © 2020 Tomas Holicky. All rights reserved.
//

import SwiftUI

struct CoinListView: View {
    @ObservedObject var viewModel: CoinListViewModel
    
    init(viewModel: CoinListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.coins) { coin in
            NavigationLink(destination: CoinDetailView(viewModel: CoinDetailViewModel(dependencies: dependencies, coin: coin))) {
                CoinListRowView(coin: coin)
            }
        }
        .environment(\.defaultMinListRowHeight, 60)
        .onAppear {
            self.viewModel.coinsAction()
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView(viewModel: CoinListViewModel(dependencies: dependencies))
    }
}
