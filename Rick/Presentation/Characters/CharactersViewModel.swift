import Foundation
import Combine

class CharactersViewModel: ObservableObject {
    @Published var characters: [CharacterResponse] = []
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
