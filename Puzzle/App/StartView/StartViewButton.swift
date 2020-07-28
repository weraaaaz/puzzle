//
//  StartViewButtonController.swift
//  Puzzle
//
//  Created by dev on 24/07/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class StartViewButton: UIControl {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        loadFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }
    
    private func loadFromNib() {
        Bundle.main.loadNibNamed("StartViewButton", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.isUserInteractionEnabled = false
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = UIColor.Custom.StartButton.background
    }

    func setup(label: String, image: UIImage?) {
        self.label.text = label
        if (image != nil) {
            self.imageView.image = image
        }
    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        layer.opacity = 0.7
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        layer.opacity = 1
//    }

}
