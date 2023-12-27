//
//  NBATeam+Mock.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/27/23.
//

import Foundation

enum NBATeamsEnum {
    case lakers
    case pistons
    // Add more cases as needed
    
    fileprivate var team: NBATeam {
        switch self {
        case .lakers:
            return NBATeam(
                id: 1,
                abbreviation: "LAL",
                city: "Los Angeles",
                conference: "Western",
                division: "Pacific",
                full_name: "Los Angeles Lakers",
                name: "Lakers"
            )
        case .pistons:
            return NBATeam(
                id: 2,
                abbreviation: "DET",
                city: "Detroit",
                conference: "Eastern",
                division: "Central",
                full_name: "Detroit Pistons",
                name: "Pistons"
            )
            // Add more cases as needed
        }
    }
}

extension NBATeam {
    static func mock(team: NBATeamsEnum) -> NBATeam {
        return team.team
    }
}
