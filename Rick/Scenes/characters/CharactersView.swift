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

struct CharactersView: View {
    @StateObject private var viewModel = CharacterViewModel()
    let columns = [GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    Text("Rick & Morty Characters")
                        .foregroundColor(.white)
                        .font(Font.custom("IBMPlexSans-Bold", size: 24))

                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(viewModel.characters) { character in
                            CharacterListItem(title: character.name,
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
            .background(Color.black)
        }
    }
}

extension Character: Identifiable {}

#Preview {
    CharactersView()
}
