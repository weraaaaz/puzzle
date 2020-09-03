//
//  CameraManager.swift
//  Puzzle
//
//  Created by dev on 02/09/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class CameraManager: NSObject {

    let imagePickerController = UIImagePickerController()
    var completionHandler: ((UIImage) -> Void)?

    func takePhoto(vc: UIViewController, completion: ((UIImage) -> Void)?) {
        completionHandler = completion
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = .camera
        vc.present(imagePickerController, animated: true, completion: nil)
    }
    
    func choosePhotoFromLibrary(vc: UIViewController, completion: ((UIImage) -> Void)?) {
        completionHandler = completion
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = .photoLibrary
        vc.present(imagePickerController, animated: true, completion: nil)
    }
}

extension CameraManager: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let completionHandler = completionHandler, let image = info[.originalImage] as? UIImage {
            completionHandler(image)
        }
        imagePickerController.dismiss(animated: true)
    }
}

