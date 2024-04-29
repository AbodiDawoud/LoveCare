//
//  SoundPlayer.swift
//  LoveCare
//
//  Created by Mohammad Dawoud on 2024-04-05.
//

import SwiftUI
import AVFoundation

var audioPlayer : AVAudioPlayer?

func playSound (soundFile : String, soundType: String){
    if let path = Bundle.main.path(forResource: soundFile, ofType: soundType){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Unable to play the sound effect")
        }
    }
}
