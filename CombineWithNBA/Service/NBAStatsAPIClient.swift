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
        // Construct the URL
        guard let url = URL(string: "https://api.balldontlie.io/v1/teams") else {
            fatalError("Invalid URL")
        }
        
        let apiKey = "f6e483c2-1847-41a1-afa7-f855db4853d7"
        
        // Create a URLRequest with the URL
        var request = URLRequest(url: url)
        
        // Set HTTP method and headers
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        
        // Perform the data task
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                // Check the HTTP response status code
                guard let response = output.response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .handleEvents(receiveOutput: { data in
                // Log raw data as a string for debugging
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Received response: \(jsonString)")
                }
            })
            .decode(type: NBATeams.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
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
        
        // Construct the URL
        guard let url = URL(string: "https://api.balldontlie.io/v1/games?dates[]=\(formattedDate)") else {
            fatalError("Invalid URL")
        }
        
        // Create a request with the API key in the Authorization header
        let apiKey = "f6e483c2-1847-41a1-afa7-f855db4853d7"
        
        // Create a URLRequest with the URL
        var request = URLRequest(url: url)
        
        // Set HTTP method and headers
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")

        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                // Check if the response status is successful
                guard let response = output.response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    let responseString = String(data: output.data, encoding: .utf8) ?? "No data"
                    print("Server Error: \(responseString)")
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: NBAGames.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    
    /// Fetches NBA games data from the API for the current week and a specific team.
    ///
    /// - Parameters:
    ///   - gameID: The ID of the NBA team for which games data is requested.
    /// - Returns: A publisher with NBA games data or an error.
    func fetchTeamGamesByCurrentWeek(with gameID: String) -> AnyPublisher<NBAGames, Error> {
        let dates = Calendar.current.getAllDaysInCurrentWeek()
        let datesQuery = dates.map { "dates[]=\($0)" }.joined(separator: "&")
        let urlString = "https://api.balldontlie.io/v1/games?team_ids[]=\(gameID)&\(datesQuery)"
        
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
    
        
        // Create a request with the API key in the Authorization header
        let apiKey = "f6e483c2-1847-41a1-afa7-f855db4853d7"
        
        // Create a URLRequest with the URL
        var request = URLRequest(url: url)
        
        // Set HTTP method and headers
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: NBAGames.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
