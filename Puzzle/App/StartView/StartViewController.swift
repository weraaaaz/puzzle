//
//  ViewController.swift
//  Puzzle
//
//  Created by dev on 23/07/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var pickButton: StartViewButton!
    @IBOutlet weak var cameraButton: StartViewButton!
    @IBOutlet weak var photoLibraryButton: StartViewButton!
    @IBOutlet weak var selectedImage: UIImageView!

    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickButton.setup(label: "Pick",  image: UIImage(systemName: "photo")!)
        cameraButton.setup(label: "Camera", image: UIImage(systemName: "camera")!)
        photoLibraryButton.setup(label: "Photo Library", image: UIImage(systemName: "folder")!)
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
    }

    @IBAction func onPickButtonTap(_ sender: Any) {
        print("onPickButtonTap")
    }
    
    @IBAction func onCameraButtonTap(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onPhotoLibraryButtonTap(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        selectedImage.image = (info[.originalImage] as? UIImage)!
        dismiss(animated: true)
    }

}

