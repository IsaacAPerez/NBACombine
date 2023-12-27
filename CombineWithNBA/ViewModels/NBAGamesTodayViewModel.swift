//
//  NBAGamesTodayViewModel.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/26/23.
//

import Combine
import Foundation

/// ViewModel for the main view of the app.
final class NBAGamesTodayViewModel: ObservableObject {
    /// Set of cancellables to store Combine publishers.
    var cancellables = Set<AnyCancellable>()
    
    @Published var nbaGames: NBAGames = NBAGames.init(data: [])

    /// Initializes the MainViewViewModel and fetches NBA team data.
    init() {
        fetchNBAGames()
    }
    
    func fetchNBAGames() {
        NBAStatsAPIClient.shared
            .fetchNBAGames(from: .now)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching NBA games: \(error)")
                }
            }, receiveValue: { [weak self] teams in
                self?.nbaGames = teams
            })
            .store(in: &cancellables)
        
    }
}

