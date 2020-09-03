//
//  BlurVisualEffectView.swift
//  Puzzle
//
//  Created by dev on 19/08/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class BlurVisualEffectView: UIVisualEffectView {

    init() {
        super.init(effect: nil)
        animator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in self.effect = UIBlurEffect(style: UIBlurEffect.Style.light) }
        animator.fractionComplete = 0.3
        self.isUserInteractionEnabled = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: Private
    private var animator: UIViewPropertyAnimator!

}
