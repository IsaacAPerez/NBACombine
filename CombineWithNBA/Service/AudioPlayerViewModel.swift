//
//  AudioPlayerViewModel.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/23/23.
//

import AVFoundation

/// A ViewModel for managing audio playback.
class AudioPlayerViewModel: ObservableObject {
    /// The AVAudioPlayer responsible for audio playback.
    var audioPlayer: AVAudioPlayer?
    
    /// A Published property indicating whether the audio is currently playing.
    @Published var isPlaying = false

    /// Initializes the AudioPlayerViewModel with the specified audio file.
    init() {
        // Load the audio file from the app's main bundle
        if let sound = Bundle.main.path(forResource: "nbaSoundTrack", ofType: "mp3") {
            do {
                // Instantiate AVAudioPlayer with the audio file
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            } catch {
                print("AVAudioPlayer could not be instantiated.")
            }
        } else {
            print("Audio file could not be found.")
        }
    }

    /// Toggles between playing and pausing the audio.
    func playOrPause() {
        guard let player = audioPlayer else { return }
        if player.isPlaying {
            // If not playing, pause the audio
            player.pause()
            isPlaying = false
        } else {
            // If playing, resume or start playing the audio
            player.play()
            isPlaying = true
        }
    }
}
