//
//  CardView.swift
//  Rick
//
//  Created by MacBookAir on 15.07.2024.
//

import SwiftUI

struct CardSupportView: View {
    let title: String
    let subtitle: String
    let subtitle2: String
    let imageName: String

    var body: some View {
        NavigationLink(destination: DetailView(title: title, subtitle: subtitle, subtitle2: subtitle2, imageName: imageName)) {
            ZStack {
                Color.gray
                HStack {
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
                                        .padding(.leading, 10)

                    VStack(alignment: .leading, spacing: 10) {
                        Text(title)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(subtitle)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text(subtitle2)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .padding()

                    Spacer()
                }
            }
            .frame(width: 350, height: 100)
            .cornerRadius(15)
        }
    }
}

#Preview {
    NavigationView {
        CardSupportView(title: "Preview Title", subtitle: "Preview Subtitle", subtitle2: "Preview Subtitle 2", imageName: "Preview Image Name")
    }
}
