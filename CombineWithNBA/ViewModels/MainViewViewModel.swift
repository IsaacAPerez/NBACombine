//
//  MainViewViewModel.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/22/23.
//

import Combine
import Foundation
import SwiftUI

/// ViewModel for the main view of the app.
final class MainViewViewModel: ObservableObject {
    /// Set of cancellables to store Combine publishers.
    var cancellables = Set<AnyCancellable>()
    
    /// Published property to store NBA team data.
    @Published var nbaTeam: NBATeams?
    
    @Published var nbaGames: NBAGames?
    
    @Published var isAudioPlaying: Bool = false {
        didSet {
            audioPlayer.playOrPause()
        }
    }
    
    var musicButtonName: String {
        if isAudioPlaying {
            return "pause.circle"
        } else {
            return "play.circle"
        }
    }
    
    /// Audio player for handling audio playback.
    let audioPlayer = AudioPlayerViewModel()

    /// Initializes the MainViewViewModel and fetches NBA team data.
    init() {
        fetchNBATeams()
        fetchNBAGames()
    }

    /// Fetches NBA team data from the API.
    func fetchNBATeams() {
        NBAStatsAPIClient.shared
            .fetchNBA()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching NBA teams: \(error)")
                }
            }, receiveValue: { [weak self] teams in
                self?.nbaTeam = teams
            })
            .store(in: &cancellables)
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

    /// Plays or pauses the audio.
    func playAudio() {
        audioPlayer.playOrPause()
    }
}
