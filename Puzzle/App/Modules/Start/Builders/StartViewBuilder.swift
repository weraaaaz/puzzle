//
//  StartViewBuilder.swift
//  Puzzle
//
//  Created by dev on 27/08/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class StartViewBuilder {
    static func showIn(window: UIWindow) {
        DispatchQueue.main.async {
            let navigationController = UINavigationController(rootViewController: StartViewController())
            navigationController.navigationBar.isHidden = true
            window.rootViewController = navigationController
        }
    }
    
}
