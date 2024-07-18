import SwiftUI
import Combine

struct CharacterDetailsView: View {
    let characterId: Int
    @StateObject private var viewModel = CharacterDetailsViewModel()
    @Environment(\.presentationMode) var presentationMode

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
                                        Text(character.episodes)
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
                    Text("Error: \(error.message)")
                        .foregroundColor(.red)
                } else {
                    ProgressView()
                        .frame(width: 100, height: 70)
                }
                
                Spacer()
            }
            .navigationBarTitle(viewModel.character?.name ?? "Loading...", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                            nc.navigationBar.barTintColor = .blue
                            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                        })
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
            })
            .onAppear {
                viewModel.fetchCharacter(id: characterId)
            }
        }
        .navigationTitle("Loading...")

    }
    
    func buttonColor(character: Character) -> Color {
        switch character.status.lowercased() {
        case "alive":
            return Color(UIColor(hexString: "#198737"))
        case "dead":
            return Color(UIColor(hexString: "#D62300"))
        default:
            return Color(UIColor(hexString: "#686874"))
        }
    }
    
    func buttonText(character: Character) -> String {
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

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}
