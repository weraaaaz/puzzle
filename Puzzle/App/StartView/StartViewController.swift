//
//  ViewController.swift
//  Puzzle
//
//  Created by dev on 23/07/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var pickButton: StartViewButton!
    @IBOutlet weak var cameraButton: StartViewButton!
    @IBOutlet weak var photoLibraryButton: StartViewButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        pickButton.setup(label: "Pick",  image: UIImage(systemName: "photo")!)
        cameraButton.setup(label: "Camera", image: UIImage(systemName: "camera")!)
        photoLibraryButton.setup(label: "Photo Library", image: UIImage(systemName: "folder")!)
    }

}
