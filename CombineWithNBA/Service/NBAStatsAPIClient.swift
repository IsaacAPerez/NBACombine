//
//  NBAStatsAPIClient.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 2/16/22.
//

import Foundation
import Combine

// MARK: - NBA Data Models

/// Represents an NBA team.
struct NBATeam: Identifiable, Codable {
    let id: Int
    let abbreviation: String
    let city: String
    let conference: String
    let division: String
    let full_name: String
    let name: String
}

/// Represents a collection of NBA teams.
struct NBATeams: Codable {
    let data: [NBATeam]
    let meta: NBAMeta
}

/// Represents metadata associated with NBA data.
struct NBAMeta: Codable {
    let total_pages: Int
    let current_page: Int
    let next_page: Int?
    let per_page: Int
    let total_count: Int
}

// MARK: - NBA Stats API Client

/// A singleton client for interacting with the NBA stats API.
class NBAStatsAPIClient {
    /// Shared instance of the NBAStatsAPIClient.
    static let shared = NBAStatsAPIClient()
    
    /// Set of cancellables to store Combine publishers.
    var cancellables = Set<AnyCancellable>()
    
    /// The selected NBA team.
    static var team: NBATeam?
    
    /// Fetches NBA team data from the API.
    ///
    /// - Returns: A publisher with NBA team data or an error.
    func fetchNBA() -> AnyPublisher<NBATeams, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.balldontlie.io/api/v1/teams")!)
            .receive(on: DispatchQueue.main)
            .map { $0.data }
            .decode(type: NBATeams.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
