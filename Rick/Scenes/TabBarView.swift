//
//  TabBarView.swift
//  Rick
//
//  Created by MacBookAir on 16.07.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            CardView()
                .tabItem {
                    Label("Play", systemImage: "play.display")
                }
            CardView()
                .tabItem {
                    Label("Menu", systemImage: "list.bullet.rectangle")
                }
            CardView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
        .accentColor(.black)
    }
}
#Preview {
    TabBarView()
}
