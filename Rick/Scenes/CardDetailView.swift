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
    let imageName: String

    var body: some View {
        ZStack {
            Color.gray
            VStack {
                AsyncImage(url: URL(string: imageName)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 70)
                                            .cornerRadius(10)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 100, height: 70)
                                    }
                
                Button(action: {
                           print("Button tapped!")
                       }) {
                           Text("Нажми меня")
                               .padding()
                               .frame(width: 300, height: 50)
                               .background(Color.blue)
                               .foregroundColor(.white)
                               .cornerRadius(10)
                           
                       }
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(title)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Text(subtitle)
                        .font(.title)
                        .foregroundColor(.red)
                    Text(subtitle2)
                        .font(.title)
                        .foregroundColor(.red)
                }
                .padding()
            }
            .navigationBarTitle(title)
        }
        .frame(width: 350, height: 600)
        .cornerRadius(15)
    }
}

#Preview {
    DetailView(title: "Preview Title", subtitle: "Preview Subtitle", subtitle2: "Preview Subtitle 2", imageName: "Preview Image Name")
}
