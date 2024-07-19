import Foundation
import Combine

class CharacterDetailsViewModel: ObservableObject {
    @Published var characterResponse: CharacterResponse?
    @Published var character: Character?
    @Published var errorMessage: IdentifiableError? = nil
    
    private var api = RickAndMortyAPI()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchCharacter(id: Int) {
        api.fetchCharacter(id: id)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching character: \(error)")
                    self.errorMessage = IdentifiableError(message: error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { characterResponse in
                self.characterResponse = characterResponse
                self.fetchEpisodes(for: characterResponse)
            }
            .store(in: &cancellables)
    }
    
    private func fetchEpisodes(for characterResponse: CharacterResponse) {
        let episodePublishers = characterResponse.episode.map { url in
            api.fetchEpisode(url: url)
        }
        
        Publishers.MergeMany(episodePublishers)
            .collect()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching episodes: \(error)")
                    self.errorMessage = IdentifiableError(message: error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { episodes in
                self.character = Character(
                    id: characterResponse.id,
                    name: characterResponse.name,
                    status: characterResponse.status,
                    species: characterResponse.species,
                    type: characterResponse.type,
                    gender: characterResponse.gender,
                    origin: characterResponse.origin,
                    location: characterResponse.location,
                    image: characterResponse.image,
                    episodes: episodes.map { $0.name }.joined(separator: ", ")
                )
            }
            .store(in: &cancellables)
    }
}
