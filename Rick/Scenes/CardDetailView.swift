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
    
    var body: some View {
        ZStack {
            Color.gray
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
                
                Button(action: {
                    print("Button tapped!")
                }) {
                    Text("Нажми меня")
                        .padding()
                        .frame(width: 320, height: 42)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Species: ")
                        .font(Font.custom("IBMPlexSans-SemiBold", size: 16))
                        .foregroundColor(.white)
                    +
                    Text(title)
                        .font(Font.custom("IBMPlexSans-Regular", size: 16))
                        .foregroundColor(.white)
                    
                    Text("Gender: ")
                        .font(Font.custom("IBMPlexSans-SemiBold", size: 16))
                        .foregroundColor(.white)
                    +
                    Text(title)
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
        }
        .frame(width: 353, height: 534)
        .cornerRadius(15)
    }
}

#Preview {
    DetailView(title: "Preview Title", subtitle: "Preview Subtitle", subtitle2: "Preview Subtitle 2", subtitle3: "Preview Subtitle 3", imageName: "Preview Image Name")
}
