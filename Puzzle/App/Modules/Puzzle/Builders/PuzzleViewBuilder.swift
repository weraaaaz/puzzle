//
//  PuzzleViewBuilder.swift
//  Puzzle
//
//  Created by dev on 27/08/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class PuzzleViewBuilder {
    static func pushIn(navigationController: UINavigationController, image: UIImage, gridCount: Int) {
        DispatchQueue.main.async {
            let vc = PuzzleViewController()
            vc.assignDependencies(image: image, gridCount: gridCount)
            navigationController.pushViewController(vc, animated:true)
        }
    }

}

