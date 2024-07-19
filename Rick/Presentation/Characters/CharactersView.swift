import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharactersViewModel()
    let columns = [GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    Text("Rick & Morty Characters")
                        .foregroundColor(.white)
                        .font(Font.custom("IBMPlexSans-Bold", size: 24))
                        .padding(.top, -20)

                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(viewModel.characters) { character in
                            CharacterListItem(character: character)
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

extension CharacterResponse: Identifiable {}

#Preview {
    CharactersView()
}
