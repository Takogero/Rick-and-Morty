//
//  2221.swift
//  Rick
//
//  Created by MacBookAir on 17.07.2024.
//

import Foundation

class RickAndMortyAPI {
    let baseURL = "https://rickandmortyapi.com/api/character"

    func fetchCharacters(completion: @escaping (Result<RickAndMortyAPIResponse, Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
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
                let response = try decoder.decode(RickAndMortyAPIResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
