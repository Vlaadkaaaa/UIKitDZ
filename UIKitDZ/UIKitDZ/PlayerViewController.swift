//
//  PlayerViewController.swift
//  UIKitDZ
//
//  Created by Владислав Лымарь on 25.09.2022.
//
import AVFoundation
import UIKit
///
class PlayerViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var nameSongLabel: UILabel!
    @IBOutlet weak var artistSongLabel: UILabel!
    @IBOutlet weak var timeStartLabel: UILabel!
    @IBOutlet weak var timeEndLabel: UILabel!
    @IBOutlet weak var nameSongTwoLabel: UILabel!
    @IBOutlet weak var playOrPauseOutlet: UIButton!
    @IBOutlet weak var changeTimeSongSliderOutlet: UISlider!
    @IBOutlet weak var changeVolumeSliderOutlet: UISlider!
    
    // MARK: - Public Properties
    var player = AVAudioPlayer()
    var timer: Timer?
    var songArray = [(nameSong: String, nameArtist: String, nameImage: String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addOutlet()
        playSong()
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self, selector: #selector(updateTime),
                                     userInfo: nil, repeats: true)
    }
    
    // MARK: - Public Methods
    @objc func updateTime() {
        self.changeTimeSongSliderOutlet.value = Float(player.currentTime)
        let currentTime = player.currentTime
        let min = Int(currentTime / 60)
        let sec = Int(currentTime.truncatingRemainder(dividingBy: 60))
        self.timeStartLabel.text = NSString(format: "%02d:%02d", min, sec) as String
        let endTime = player.currentTime - player.duration
        let endMin = Int(endTime / 60)
        let endSec = Int(-endTime.truncatingRemainder(dividingBy: 60))
        self.timeEndLabel.text = NSString(format: "%02d:%02d", endMin, endSec) as String
    }
    func playSong() {
        do {
            guard let audioPath = Bundle.main.path(forResource: songArray[0].nameSong, ofType: "mp3") else {return}
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath ))
            self.changeTimeSongSliderOutlet.maximumValue = Float(player.duration)
        } catch {
            print("Error play audio")
        }
        self.player.play()
    }
    
    func addOutlet() {
        nameSongLabel.text = songArray[0].nameSong
        nameSongTwoLabel.text = songArray[0].nameSong
        artistSongLabel.text = songArray[0].nameArtist
        songImage.image = UIImage(named: songArray[0].nameImage)
        timeStartLabel.text = "\(player.currentTime)"
        timeEndLabel.text = "\(player.duration)"
    }
    
    // MARK: - IBAction
    @IBAction func playOrPauseAction(_ sender: Any) {
        if player.isPlaying {
            player.stop()
            playOrPauseOutlet.setImage(UIImage(named: "play"), for: .normal)
        } else {
            player.play()
            playOrPauseOutlet.setImage(UIImage(named: "pause"), for: .normal)
            
        }
    }
    @IBAction func changeTimeSongSliderAction(_ sender: Any) {
        player.currentTime = TimeInterval(changeTimeSongSliderOutlet.value)
    }
    @IBAction func changeVolumeSliderAction(_ sender: Any) {
        player.volume =  changeVolumeSliderOutlet.value
    }
    @IBAction func backTrackAction(_ sender: Any) {
    }
    
    @IBAction func nextTrackAction(_ sender: Any) {
    }
    
}
