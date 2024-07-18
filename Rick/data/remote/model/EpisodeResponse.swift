import Foundation

struct EpisodeResponse: Codable {
    let id: Int
    let name: String
    let airDate: String?  // Make this property optional
    let episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"  // Map to the actual key in the JSON
        case episode
        case characters
        case url
        case created
    }
}
