//
//  CustomIntensityVisualEffectView.swift
//  Puzzle
//
//  Created by dev on 19/08/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class CustomIntensityVisualEffectView: UIVisualEffectView {

    init(effect: UIVisualEffect, intensity: CGFloat) {
        super.init(effect: nil)
        animator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in self.effect = effect }
        animator.fractionComplete = intensity
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: Private
    private var animator: UIViewPropertyAnimator!

}
