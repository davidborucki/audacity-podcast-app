//
//  ExploreViewController.swift
//  ExploreViewController
//
//  Created by Dave Borucki on 9/12/22.
//

import Foundation
import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet weak var searchBar: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let noThumbnail = "noThumbnail.png"
        let image = UIImage(named: noThumbnail)
        let imageView = UIImageView(image: image!)
        imageView.isUserInteractionEnabled = false
    }

    @IBAction func searchFunc(_ sender: UITextField) {
        searchBar.text = ""
    }
    @IBAction func SearchButton(_ sender: Any) {
        self.view.endEditing(true)
    }
    
}

