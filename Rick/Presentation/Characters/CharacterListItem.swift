import SwiftUI

struct CharacterListItem: View {
    let character: CharacterResponse
    
    var body: some View {
        NavigationLink(destination: CharacterDetailsView(characterId: character.id)) {
            
            ZStack {
                Color(UIColor(hexString: "#151517"))
                HStack {
                    AsyncImage(url: URL(string: character.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 84, height: 64)
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 100, height: 70)
                    }
                    .padding(.leading, 10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(character.name)
                            .font(Font.custom("IBMPlexSans-Medium", size: 18))
                            .foregroundColor(.white)
                        
                        HStack {
                            Text(character.status)
                                .font(Font.custom("IBMPlexSans-SemiBold", size: 12))
                                .foregroundColor(statusColor(for: character.status))
                            +
                            Text(" • ")
                                .font(Font.custom("IBMPlexSans-SemiBold", size: 12))
                                .foregroundColor(.white)
                            +
                            Text(character.species)
                                .font(Font.custom("IBMPlexSans-SemiBold", size: 12))
                                .foregroundColor(.white)
                        }
                        
                        Text(character.gender)
                            .font(Font.custom("IBMPlexSans-Regular", size: 12))
                            .foregroundColor(.white)
                            .padding(.top, 5)
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            .frame(width: 353, height: 96)
            .cornerRadius(24)
            
        }
    }
    
    func statusColor(for status: String) -> Color {
        switch status.lowercased() {
        case "alive":
            return .green
        case "dead":
            return .red
        default:
            return .gray
        }
    }
}
//
//#Preview {
//    NavigationView {
//        CharacterListItem()
//    }
//}
