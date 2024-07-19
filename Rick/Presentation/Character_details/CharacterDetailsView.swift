import SwiftUI
import Combine

struct CharacterDetailsView: View {
    let characterId: Int
    @StateObject private var viewModel = CharacterDetailsViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var characterName: String = "Loading..."
    
    init(characterId: Int) {
        self.characterId = characterId
        
        UINavigationBar.appearance().titleTextAttributes = [
            .font : UIFont(name: "IBMPlexSans-Bold", size: 24)!,
            .foregroundColor: UIColor(hexString: "#FFFFFF"),
        ]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                if let character = viewModel.character {
                    VStack {
                        CardDetailsContent(character: character)
                    }.padding(20)
                        .onAppear {
                            self.characterName = character.name
                        }
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error.message)")
                        .foregroundColor(.red)
                } else {
                    ProgressView()
                        .frame(width: 100, height: 70)
                }
            }
            .onAppear { viewModel.fetchCharacter(id: characterId) }
        }
        .navigationBarTitle(characterName, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.white)
        })
    }
}


extension Character {
    static let mockCharacter = Character(
        id: 1,
        name: "Rick Sanchez",
        status: "Alive",
        species: "Human",
        type: "",
        gender: "Male",
        origin: LocationResponse(name: "Earth (C-137)", url: ""),
        location: LocationResponse(name: "Citadel of Ricks", url: ""),
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episodes: "Pilot, Lawnmower Dog, Anatomy Park, M. Night Shaym-Aliens!, Meeseeks and Destroy, Rick Potion #9"
    )
}

struct CharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView(characterId: Character.mockCharacter.id)
    }
}
