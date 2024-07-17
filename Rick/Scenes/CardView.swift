//
//  ContentView.swift
//  Rick
//
//  Created by MacBookAir on 15.07.2024.
//

import SwiftUI

struct IdentifiableError: Identifiable {
    let id = UUID()
    let message: String
}

struct CardView: View {
    @StateObject private var viewModel = RickAndMortyViewModel()
    let columns = [GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    Text("Rick & Morty Characters")
                        .font(Font.custom("IBMPlexSans-Bold", size: 24))

                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.characters) { character in
                            CardSupportView(title: character.name,
                                            subtitle: character.status,
                                            subtitle2: character.species,
                                            subtitle3: character.gender,
                                            imageName: character.image)
                        }
                    }
                }
                .padding()
            }
            .onAppear {
                viewModel.fetchCharacters()
            }
            .alert(item: $viewModel.errorMessage) { error in
                Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
            }
        }
    }
}

extension Character: Identifiable {}

#Preview {
    CardView()
}
