//
//  ViewController.swift
//  Xylophone Pro
//
//  Created by Dmitriy Babichev on 29.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    let keyTitles = ["C", "D", "E", "F", "G", "A", "B"]

    @IBOutlet var keys: [UIButton]!

    @IBAction func keyPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .autoreverse) {
            sender.alpha = 0.5
        } completion: { _ in sender.alpha = 1 }

        guard let currentTitle = sender.currentTitle else { return }
        playSound(note: currentTitle)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        for key in keys {
            key.layer.cornerRadius = 10
        }
    }

    func playSound(note: String) {
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else { return }
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
}

