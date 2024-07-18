import Foundation
import Combine

class CharacterDetailsViewModel: ObservableObject {
    @Published var character: CharacterResponse?
    @Published var episode: EpisodeResponse?
    @Published var errorMessage: IdentifiableError? = nil

    private var api = RickAndMortyAPI()
    private var cancellables = Set<AnyCancellable>()

    func fetchCharacter(id: Int) {
        api.fetchCharacter(id: id)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = IdentifiableError(message: error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { character in
                self.character = character
            }
            .store(in: &cancellables)
    }
    
    func fetchEpisode(id: Int) {
        api.fetchEpisode(id: id) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let episode):
                    print(episode)
                case .failure(let error):
                    self.errorMessage = IdentifiableError(message: error.localizedDescription)
                }
            }
        }
    }
}
