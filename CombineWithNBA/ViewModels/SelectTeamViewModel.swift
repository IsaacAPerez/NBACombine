//
//  SelectTeamViewModel.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 1/3/24.
//

import Combine
import Foundation

/// ViewModel for selecting an NBA team.
final class SelectTeamViewModel: ObservableObject {
    /// Set of cancellables to store Combine publishers.
    var cancellables = Set<AnyCancellable>()
    
    /// Published property indicating whether the team selection view is currently visible.
    @Published var showingTeam = false
    
    /// NBA team data.
    let nbaTeam: NBATeams
    
    /// NBA games data.
    var nbaGames: NBAGames?
    
    /// Initializes the SelectTeamViewModel with NBA team data.
    /// - Parameter nbaTeam: The NBA team data.
    init(nbaTeam: NBATeams) {
        self.nbaTeam = nbaTeam
    }
    
    /// Fetches the current week's schedule for the specified NBA team.
    /// - Parameter teamID: The ID of the NBA team for which the schedule is fetched.
    func fetchWeekSchedule(for teamID: Int) {
        NBAStatsAPIClient.shared
            .fetchTeamGamesByCurrentWeek(with: teamID.description)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [self] completion in
                switch completion {
                case .finished:
                    showingTeam.toggle()
                case .failure(let error):
                    print("Error fetching NBA team games: \(error)")
                }
            }, receiveValue: { [weak self] games in
                self?.nbaGames = games
            })
            .store(in: &cancellables)
    }
}
