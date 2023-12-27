//
//  NBAGame+Mock.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/27/23.
//

import Foundation

extension NBAGame {
    static func mock() -> NBAGame {
        return NBAGame(
            id: 1038000,
            date: "2023-12-26T00:00:00.000Z",
            home_team: .mock(team: .lakers),
            home_team_score: 110,
            period: 4,
            postseason: false,
            season: 2023,
            status: "Final",
            time: nil,
            visitor_team: .mock(team: .pistons),
            visitor_team_score: 102
        )
    }
}
