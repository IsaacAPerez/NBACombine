//
//  NBATeams+Mock.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/27/23.
//

import Foundation

extension NBATeams {
    static func mock() -> NBATeams {
        return NBATeams(data: [.mock(team: .lakers), .mock(team: .pistons)], meta: .mock())
    }
}
