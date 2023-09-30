//
//  AudioPlayer.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 30/09/2023.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))  // will be depricated in future versions
            audioPlayer?.play()
        } catch {
            print("Could not play the sound file.")
        }
    }
}
