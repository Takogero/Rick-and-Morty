import SwiftUI
import Combine

struct CharacterDetailsView: View {
    let characterId: Int
    @StateObject private var viewModel = CharacterDetailsViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color.black 
                    .edgesIgnoringSafeArea(.all)
                
                if let character = viewModel.character {
                    VStack {
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(width: 353, height: 566)
                            .cornerRadius(24)
                            .overlay(
                                VStack {
                                    AsyncImage(url: URL(string: character.image)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 320, height: 320)
                                            .cornerRadius(12)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 100, height: 70)
                                    }
                                    .padding(.top)
                                    
                                    Button(action: {
                                        print("Button tapped!")
                                    }) {
                                        Text(buttonText(character: character))
                                            .padding()
                                            .frame(width: 320, height: 42)
                                            .background(buttonColor(character: character))
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("Species: ")
                                            .font(Font.custom("IBMPlexSans-SemiBold", size: 16))
                                            .foregroundColor(.white)
                                        +
                                        Text(character.species)
                                            .font(Font.custom("IBMPlexSans-Regular", size: 16))
                                            .foregroundColor(.white)
                                        
                                        Text("Gender: ")
                                            .font(Font.custom("IBMPlexSans-SemiBold", size: 16))
                                            .foregroundColor(.white)
                                        +
                                        Text(character.gender)
                                            .font(Font.custom("IBMPlexSans-Regular", size: 16))
                                            .foregroundColor(.white)
                                        
                                        Text("Status: ")
                                            .font(Font.custom("IBMPlexSans-SemiBold", size: 16))
                                            .foregroundColor(.white)
                                        +
                                        Text(character.status)
                                            .font(Font.custom("IBMPlexSans-Regular", size: 16))
                                            .foregroundColor(.white)
                                        
                                        Text("Episodes: ")
                                            .font(Font.custom("IBMPlexSans-SemiBold", size: 16))
                                            .foregroundColor(.white)
                                        +
                                        Text(character.episode.joined(separator: ", "))
                                            .font(Font.custom("IBMPlexSans-Regular", size: 16))
                                            .foregroundColor(.white)
                                        
                                        Text("Last known location: ")
                                            .font(Font.custom("IBMPlexSans-SemiBold", size: 16))
                                            .foregroundColor(.white)
                                        +
                                        Text(character.location.name)
                                            .font(Font.custom("IBMPlexSans-Regular", size: 16))
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                }
                            )
                    }
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error.localizedDescription)")
                        .foregroundColor(.red)
                } else {
                    ProgressView()
                        .frame(width: 100, height: 70)
                }
                
                Spacer()
            }
            .navigationBarTitle(viewModel.character?.name ?? "Loading...", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                print("Back button tapped")
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
            })
            .onAppear {
                viewModel.fetchCharacter(id: characterId)
            }
        }
    }
    
    func buttonColor(character: CharacterResponse) -> Color {
        switch character.status.lowercased() {
        case "alive":
            return Color(UIColor(hexString: "#198737"))
        case "dead":
            return Color(UIColor(hexString: "#D62300"))
        default:
            return Color(UIColor(hexString: "#686874"))
        }
    }
    
    func buttonText(character: CharacterResponse) -> String {
        switch character.status.lowercased() {
        case "alive":
            return "Alive"
        case "dead":
            return "Dead"
        default:
            return "Unknown"
        }
    }
}
