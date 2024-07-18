//
//  Character.swift
//  Rick
//
//  Created by MacBookAir on 18.07.2024.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: LocationResponse
    let location: LocationResponse
    let image: String
    let episodes: [EpisodeResponse]
}
