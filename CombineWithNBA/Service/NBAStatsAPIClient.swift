//
//  NBAStatsAPIClient.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 2/16/22.
//

import Foundation
import Combine

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
    
    func fetchNBAGames(from data: Date) -> AnyPublisher<NBAGames, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.balldontlie.io/api/v1/games?dates[]=2023-12-26")!)
            .receive(on: DispatchQueue.main)
            .map { $0.data }
            .decode(type: NBAGames.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
