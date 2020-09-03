//
//  PuzzleViewController.swift
//  Puzzle
//
//  Created by dev on 27/08/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class PuzzleViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var image = UIImage()
    var gridCount = 6
     
    func assignDependencies(image: UIImage, gridCount: Int) {
        self.image = image
        self.gridCount = gridCount
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = self.image
    }
}
