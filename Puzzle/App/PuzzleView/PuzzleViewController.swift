//
//  PuzzleViewController.swift
//  Puzzle
//
//  Created by dev on 19/08/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class PuzzleViewController: UIViewController {
    
    var image = UIImage()
    var gridCount = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func assignDependencies(image: UIImage, gridCount: Int) {
        self.image = image
        self.gridCount = gridCount
   }

}
