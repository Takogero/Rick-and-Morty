//
//  CardDetailView.swift
//  Rick
//
//  Created by MacBookAir on 15.07.2024.
//

import SwiftUI

struct DetailView: View {
    let title: String
    let subtitle: String
    let subtitle2: String
    let subtitle3: String
    let imageName: String
    
    var buttonColor: Color {
        switch subtitle.lowercased() {
        case "alive":
            return Color(UIColor(hexString: "#198737"))
        case "dead":
            return Color(UIColor(hexString: "#D62300"))
        default:
            return Color(UIColor(hexString: "#686874"))
        }
    }
    
    var buttonText: String {
        switch subtitle.lowercased() {
        case "alive":
            return "Alive"
        case "dead":
            return "Dead"
        default:
            return "Unknown"
        }
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.red)
                .frame(width: 353, height: 566)
                .cornerRadius(24)
                .overlay(
                    VStack {
                        AsyncImage(url: URL(string: imageName)) { image in
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
                            Text(buttonText)
                                .padding()
                                .frame(width: 320, height: 42)
                                .background(buttonColor)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Species: ")
                                .font(Font.custom("IBMPlexSans-SemiBold", size: 16))
                                .foregroundColor(.white)
                            +
                            Text(subtitle2)
                                .font(Font.custom("IBMPlexSans-Regular", size: 16))
                                .foregroundColor(.white)
                            
                            Text("Gender: ")
                                .font(Font.custom("IBMPlexSans-SemiBold", size: 16))
                                .foregroundColor(.white)
                            +
                            Text(subtitle3)
                                .font(Font.custom("IBMPlexSans-Regular", size: 16))
                                .foregroundColor(.white)
                            
                            Text("Status: ")
                                .font(Font.custom("IBMPlexSans-SemiBold", size: 16))
                                .foregroundColor(.white)
                            +
                            Text(subtitle)
                                .font(Font.custom("IBMPlexSans-Regular", size: 16))
                                .foregroundColor(.white)
                            
                            Text("Episodes: ")
                                .font(Font.custom("IBMPlexSans-SemiBold", size: 16))
                                .foregroundColor(.white)
                            +
                            Text(title)
                                .font(Font.custom("IBMPlexSans-Regular", size: 16))
                                .foregroundColor(.white)
                            
                            Text("Last known location: ")
                                .font(Font.custom("IBMPlexSans-SemiBold", size: 16))
                                .foregroundColor(.white)
                            +
                            Text(title)
                                .font(Font.custom("IBMPlexSans-Regular", size: 16))
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                        .navigationBarTitle(title)
                )
        }
        Spacer()
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: "Example Title", subtitle: "Alive", subtitle2: "Human", subtitle3: "Male", imageName: "https://example.com/image.jpg")
    }
}
    
