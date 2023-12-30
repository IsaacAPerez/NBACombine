//
//  NBAGameViewModel.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/27/23.
//

import Combine
import Foundation

/// ViewModel for the main view of the app.
final class NBAGameViewModel: ObservableObject {
    /// Set of cancellables to store Combine publishers.
    var cancellables = Set<AnyCancellable>()
    var game: NBAGame
    
    var homeTeam: String {
        game.home_team.name
    }

    var awayTeam: String {
        game.visitor_team.name
    }

    var status: String {
        game.status
    }

    var homeScore: String {
        "\(game.home_team_score)"
    }

    var awayScore: String {
        "\(game.visitor_team_score)"
    }

    var time: String {
        game.time ?? "N/A"
    }

    var quarter: String {
        if game.period < 1 {
            return "Game has not started"
        } else {
            return "\(game.period) Quarter"
        }
    }
    
    init(game: NBAGame) {
        self.game = game
    }
    
    
}


