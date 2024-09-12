import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharactersViewModel()
    @State private var searchText: String = ""
    @State private var selectedStatus: String? = nil
    @State private var selectedGender: String? = nil
    @State private var showFilterSheet = false
    let columns = [GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text("Rick & Morty Characters")
                        .foregroundColor(.white)
                        .font(Font.custom("IBMPlexSans-Bold", size: 24))
                        .padding(.top, -20)

                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search characters")
                        .padding(.top, 20)

                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(filteredCharacters) { character in
                            CharacterListItem(character: character)
                        }
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showFilterSheet.toggle()
                    }) {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .foregroundColor(.white)
                    }
                }
            }
            .sheet(isPresented: $showFilterSheet) {
                FilterView(selectedStatus: $selectedStatus, selectedGender: $selectedGender)
                    .presentationDetents([.fraction(0.41)])
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

    private var filteredCharacters: [CharacterResponse] {
        var filtered = viewModel.characters

        if !searchText.isEmpty {
            filtered = filtered.filter { character in
                character.name.localizedCaseInsensitiveContains(searchText)
            }
        }

        if let status = selectedStatus {
            filtered = filtered.filter { character in
                character.status == status
            }
        }

        if let gender = selectedGender {
            filtered = filtered.filter { character in
                character.gender == gender
            }
        }

        return filtered
    }
}

extension CharacterResponse: Identifiable {}

#Preview {
    CharactersView()
}
