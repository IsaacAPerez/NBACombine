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
    
    /// Fetches NBA games data from the API for a specific date.
    ///
    /// - Parameter date: The date for which games data is requested (default is the current date).
    /// - Returns: A publisher with NBA games data or an error.
    func fetchNBAGames(from date: Date = .now) -> AnyPublisher<NBAGames, Error> {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: date)
        return URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.balldontlie.io/api/v1/games?dates[]=\(formattedDate)")!)
            .receive(on: DispatchQueue.main)
            .map { $0.data }
            .decode(type: NBAGames.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    /// Fetches NBA games data from the API for the current week and a specific team.
    ///
    /// - Parameters:
    ///   - gameID: The ID of the NBA team for which games data is requested.
    /// - Returns: A publisher with NBA games data or an error.
    func fetchTeamGamesByCurrentWeek(with gameID: String) -> AnyPublisher<NBAGames, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.balldontlie.io/api/v1/games?team_ids[]=\(gameID)&dates[]=\(Calendar.current.getAllDaysInCurrentWeek())")!)
            .receive(on: DispatchQueue.main)
            .map { $0.data }
            .decode(type: NBAGames.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
