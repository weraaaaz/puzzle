//
//  ViewController.swift
//  Puzzle
//
//  Created by dev on 23/07/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var pickButton: StartButton!
    @IBOutlet weak var cameraButton: StartButton!
    @IBOutlet weak var photoLibraryButton: StartButton!
    
    let cameraManager = CameraManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickButton.setup(label: "Pick",  image: UIImage(systemName: "photo")!)
        cameraButton.setup(label: "Camera", image: UIImage(systemName: "camera")!)
        photoLibraryButton.setup(label: "Photo Library", image: UIImage(systemName: "folder")!)
    }

    @IBAction func onPickButtonTap(_ sender: Any) {
        print("onPickButtonTap")
    }
    
    @IBAction func onCameraButtonTap(_ sender: Any) {
        cameraManager.takePhoto(vc: self, completion: { image in
            SelectGridViewBuilder.pushIn(navigationController: self.navigationController!, image: image)
        })
    }
    
    @IBAction func onPhotoLibraryButtonTap(_ sender: Any) {
        cameraManager.choosePhotoFromLibrary(vc: self, completion: { image in
           SelectGridViewBuilder.pushIn(navigationController: self.navigationController!, image: image)
       })
    }

}

