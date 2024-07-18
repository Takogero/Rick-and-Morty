//
//  SwiftUIView.swift
//  Rick
//
//  Created by MacBookAir on 17.07.2024.
//

import Foundation

// MARK: - RickAndMortyAPIResponse
struct CharactersAPIResponse: Codable {
    let info: PagingInfo
    let results: [CharacterResponse]
}

// MARK: - Info
struct PagingInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

// MARK: - Character
struct CharacterResponse: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: LocationResponse
    let location: LocationResponse
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct LocationResponse: Codable {
    let name: String
    let url: String
}
