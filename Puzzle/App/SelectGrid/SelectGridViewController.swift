//
//  SelectGridViewController.swift
//  Puzzle
//
//  Created by dev on 28/07/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class SelectGridViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var decreaseCountButton: UIButton!
    @IBOutlet weak var increaseCountButton: UIButton!

    var image = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = self.image
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.addSubview(blurEffectView)
        decreaseCountButton.roundCorners([.topLeft, .bottomLeft], radius: 8)
        increaseCountButton.roundCorners([.topRight, .bottomRight], radius: 8)
    }

    func assignDependencies(image: UIImage) {
        self.image = image
    }

    @IBAction func onDecreaseButtonTap(_ sender: Any) {
    }
    
    @IBAction func onIncreaseButtonTap(_ sender: Any) {
    }

}
