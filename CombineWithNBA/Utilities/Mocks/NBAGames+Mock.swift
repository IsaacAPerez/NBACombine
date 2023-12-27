//
//  NBAGames+Mock.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/27/23.
//

import Foundation

extension NBAGames {
    static func mock() -> NBAGames {
        return NBAGames(data: [.mock(), .mock()])
    }
}
