//
//  CardView.swift
//  Rick
//
//  Created by MacBookAir on 15.07.2024.
//

import SwiftUI

struct CharacterListItem: View {
    let title: String
    let subtitle: String
    let subtitle2: String
    let subtitle3: String
    let imageName: String
    
    var body: some View {
        NavigationLink(destination: CharacterDetailsView(title: title, subtitle: subtitle, subtitle2: subtitle2, subtitle3: subtitle3, imageName: imageName)) {
            
            ZStack {
                Color(UIColor(hexString: "#151517"))
                HStack {
                    AsyncImage(url: URL(string: imageName)) { image in
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
                        Text(title)
                            .font(Font.custom("IBMPlexSans-Medium", size: 18))
                            .foregroundColor(.white)
                        
                        HStack {
                            Text(subtitle)
                                .font(Font.custom("IBMPlexSans-SemiBold", size: 12))
                                .foregroundColor(statusColor(for: subtitle))
                            +
                            Text(" • ")
                                .font(Font.custom("IBMPlexSans-SemiBold", size: 12))
                                .foregroundColor(.white)
                            +
                            Text(subtitle2)
                                .font(Font.custom("IBMPlexSans-SemiBold", size: 12))
                                .foregroundColor(.white)
                        }
                        
                        Text(subtitle3)
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

#Preview {
    NavigationView {
        CharacterListItem(title: "Preview Title", subtitle: "Preview Subtitle", subtitle2: "Preview Subtitle 2", subtitle3: "Preview Subtitle 3", imageName: "Preview Image Name")
    }
}
