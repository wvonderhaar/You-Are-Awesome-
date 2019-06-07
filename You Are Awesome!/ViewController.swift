//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Walker Vonder Haar on 5/25/19.
//  Copyright © 2019 Walker Vonder Haar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageIndex = -1
    var soundIndex = -1
    let numberOfImages = 11
    let numberOfSounds = 5

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex: Int
        repeat {
            newIndex = Int.random(in: 0..<maxValue)
        } while lastNumber == newIndex
       return newIndex
    }

    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            //            check if sound.data is a sound file
            // if let is good to use if there is a chance for a nil
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                //                if sound.data is not valid audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound")
            }
        } else {
            print("ERROR: file \(soundName) didn't load")
        }
    }

    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if soundSwitch.isOn == false && soundIndex != -1 {
                awesomePlayer.stop()
            }
    }

    @IBAction func showMessagePressed(_ sender: UIButton) {
       
        let messages = ["You are Fantastic!!!",
                        "You are Great!",
                        "You are Amazing",
                        "You are Awesome",
                        "You is Kind",
                        "You is Smart",
                        "You is Important",
                        "You make me smile",
                        "You Brighten my Day!",
                        "You are Fabulous",
                        "You've got the design skills of Jony Ive",
                        "I can't wait to download your app!"]

//      Show a message
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]

//      Show an image
        imageIndex = nonRepeatingRandom(lastNumber: imageIndex, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageIndex)")

//        if soundSwitch.isOn == true {
        if soundSwitch.isOn {

            //      Get a random number to use in our soundName file
            soundIndex = nonRepeatingRandom(lastNumber: soundIndex, maxValue: numberOfSounds)

            let soundName = "sound\(soundIndex)"


            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }


    }

}
