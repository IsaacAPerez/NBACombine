//
//  NBAGame.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/26/23.
//

/// Represents an NBA game.
struct NBAGame: Codable {
    /// The unique identifier for the game.
    let id: Int
    
    /// The date and time when the game took place.
    let date: String
    
    /// The details of the home team participating in the game.
    let home_team: NBATeam
    
    /// The score of the home team at the end of the game.
    let home_team_score: Int
    
    /// The current period of the game.
    let period: Int
    
    /// Indicates whether the game is part of the postseason (playoffs).
    let postseason: Bool
    
    /// The season in which the game took place.
    let season: Int
    
    /// The current status of the game (e.g., "Final", "1st Qtr", "In Progress").
    let status: String
    
    /// The remaining time or specific time-related information about the game.
    let time: String?
    
    /// The details of the visitor team participating in the game.
    let visitor_team: NBATeam
    
    /// The score of the visitor team at the end of the game.
    let visitor_team_score: Int
}

