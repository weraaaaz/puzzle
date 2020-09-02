//
//  SelectGridViewBuilder.swift
//  Puzzle
//
//  Created by dev on 27/08/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class SelectGridViewBuilder {
    static func pushIn(navigationController: UINavigationController, image: UIImage) {
        DispatchQueue.main.async {
            let vc = SelectGridViewController()
            vc.assignDependencies(image: image)
            navigationController.pushViewController(vc, animated:true)
        }
    }

}
