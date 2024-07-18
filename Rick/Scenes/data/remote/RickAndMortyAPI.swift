import Foundation
import Combine

class RickAndMortyAPI {
    let baseURL = "https://rickandmortyapi.com/api/"


    func fetchCharacters(completion: @escaping (Result<CharactersAPIResponse, Error>) -> Void) {
        let urlString = "\(baseURL)/character"
        guard let url = URL(string: urlString) else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(CharactersAPIResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
    
    func fetchCharacter(id: Int) -> AnyPublisher<CharacterResponse, Error> {
        let urlString = "\(baseURL)/character/\(id)"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let httpResponse = output.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: CharacterResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchEpisode(id: Int, completion: @escaping (Result<EpisodeResponse, Error>) -> Void) {
        let urlString = "\(baseURL)/episode/\(id)"
        guard let url = URL(string: urlString) else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                return
            }

            do {
                let decoder = JSONDecoder()
                let episode = try decoder.decode(EpisodeResponse.self, from: data)
                completion(.success(episode))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
