//
//  SwiftUIView.swift
//  Rick
//
//  Created by MacBookAir on 17.07.2024.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil
    private var cancellable: AnyCancellable?

    init(url: URL) {
        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: UIImage.self, decoder: .init())
            .replaceError(with: nil)
            .eraseToAnyPublisher()
            .assign(to: \.image, on: self)
    }
}

#Preview {
    SwiftUIView()
}
