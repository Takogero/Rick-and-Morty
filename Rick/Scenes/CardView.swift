//
//  ContentView.swift
//  Rick
//
//  Created by MacBookAir on 15.07.2024.
//

import SwiftUI

struct CardView: View {
    let columns = [GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    Text("Rick & Morty Characters")
                        .font(Font.custom("IBMPlexSans-Bold", size: 24))
                        

                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(0..<10) { index in
                            CardSupportView(title: "Card \(index)", subtitle: "Subtitle \(index)", subtitle2: "Subtitle \(index)", imageName: "image\(index)")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CardView()
}
