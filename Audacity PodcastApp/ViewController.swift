//
//  ViewController.swift
//  Audacity PodcastApp
//
//  Created by Dave Borucki on 9/12/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
//    private let imageView : UIImageView = {
//        let imageView = UIImageView(frame: .zero)
//        imageView.contentMode = .scaleAspectFit
//        imageView.image = UIImage(named: "bgTest.jpg")
//        imageView.isUserInteractionEnabled = true;
//        return imageView
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(imageView) target: self
//        imageView.frame = CGRect(x: 0, y: 44, width: 414, height: 714)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap(_:)))
        background.isUserInteractionEnabled = true
        tapGesture.numberOfTapsRequired = 2
        background.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didDoubleTap(_ gesture: UITapGestureRecognizer) {
        let likedImage = UIImage(named: "heartSmaller")
            
            
        
        likeButton.setImage(likedImage, for: .normal)
        //likeButton.contentMode = .center //344 436 50 50
        likeButton.imageView?.contentMode = .scaleAspectFit
        
        
        
    }
    @IBAction func pressedLikeButton(_ sender: UIButton) {
        if (likeButton.currentImage == UIImage(named: "heartImage") || likeButton.currentImage == UIImage(named: "wHeartSmaller")) {
            likeButton.setImage(UIImage(named: "heartSmaller"), for: .normal)
        } else {
            likeButton.setImage(UIImage(named: "wHeartSmaller"), for: .normal)
        }
    }
    
}

