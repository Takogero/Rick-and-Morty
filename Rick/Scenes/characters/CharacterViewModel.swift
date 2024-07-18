//
//  23232.swift
//  Rick
//
//  Created by MacBookAir on 17.07.2024.
//

import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var errorMessage: IdentifiableError? = nil

    private var api = RickAndMortyAPI()
    
    func fetchCharacters() {
        api.fetchCharacters { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.characters = response.results
                case .failure(let error):
                    self?.errorMessage = IdentifiableError(message: error.localizedDescription)
                }
            }
        }
    }
}
