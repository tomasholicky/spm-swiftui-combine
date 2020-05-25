//
//  MainTabView.swift
//  spm-swiftui-combine
//
//  Created by Tomas Holicky on 13/05/2020.
//  Copyright © 2020 Tomas Holicky. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            CoinListView(viewModel: CoinListViewModel(dependencies: dependencies))
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("First Tab")
            }
            Text("The content of the second view")
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("Second Tab")
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
    }
}
