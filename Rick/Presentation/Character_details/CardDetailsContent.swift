import SwiftUI

struct CardDetailsContent: View {
    let character: Character
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 70)
            }
            .frame(width: 320, height: 320)
            .cornerRadius(12)
            .padding(.top, 20)
            
            Spacer(minLength: 8)
            
            VStack {
                Text(buttonText(character: character))
                    .padding()
                    .frame(width: 320, height: 42)
                    .background(buttonColor(character: character))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer(minLength: 14)
            
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
            }.padding([.leading, .trailing, .bottom], 20)
        }
        .background(Color(uiColor: UIColor(hexString: "#151517")))
        .cornerRadius(24)
    }
}

struct CardDetailsContent_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCharacter = Character(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            type: "",
            gender: "Male",
            origin: LocationResponse(name: "Earth (C-137)", url: ""),
            location: LocationResponse(name: "Earth (Replacement Dimension)", url: ""),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episodes: "S01E01, S01E02, S01E03"
        )
        CardDetailsContent(character: sampleCharacter)
            .background(Color.black)
    }
}
