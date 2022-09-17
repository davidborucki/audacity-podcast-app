//
//  ViewController.swift
//  Audacity PodcastApp
//
//  Created by Dave Borucki on 9/12/22.
//
import AVKit
import AVFoundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "1mts-short", ofType: "mp4")!))
    
/*
VIEW DID LOAD
*/
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap(_:)))
        background.isUserInteractionEnabled = true
        tapGesture.numberOfTapsRequired = 2
        background.addGestureRecognizer(tapGesture)
    }
    
/*
VIDEO PLAYER
*/
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Video player frame *
        let graphRect:CGRect = CGRect(x: 0, y: 85, width: 414, height: 673)
        let theView:UIView = UIView(frame: graphRect)
        // * Video player frame
        
        // AVPlayer setup *
        let layer = AVPlayerLayer(player: player)
        layer.frame = theView.frame //frame of video
        view.layer.addSublayer(layer)
        // * AVPlayer setup
        
        player.play()
        
        // * AVPlayer pause
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        tapRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.playPause.rawValue as Int)];
          
        self.view.addGestureRecognizer(tapRecognizer)
        // * AVPlayer pause
    }
    
/*
SCREEN TAP
*/
    @objc private func didTap(_ gesture: UITapGestureRecognizer) {
        player.pause()
    }
    
/*
SCREEN DOUBLE TAP
*/
    @objc private func didDoubleTap(_ gesture: UITapGestureRecognizer) {
        let likedImage = UIImage(named: "heartSmaller")
        likeButton.setImage(likedImage, for: .normal)
        likeButton.imageView?.contentMode = .scaleAspectFit
    }
    
/*
LIKE BUTTON
*/
    @IBAction func pressedLikeButton(_ sender: UIButton) {
        if (likeButton.currentImage == UIImage(named: "heartImage") || likeButton.currentImage == UIImage(named: "wHeartSmaller")) {
            likeButton.setImage(UIImage(named: "heartSmaller"), for: .normal)
        } else {
            likeButton.setImage(UIImage(named: "wHeartSmaller"), for: .normal)
        }
    }
    
}

