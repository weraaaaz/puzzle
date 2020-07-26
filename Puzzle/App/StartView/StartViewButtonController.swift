//
//  StartViewButtonController.swift
//  Puzzle
//
//  Created by dev on 24/07/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class StartViewButton: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

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
        Bundle.main.loadNibNamed("LearnTutorialOverlay", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    func configure() -> AnyPublisher<Void, Never> {
        messageLabel.setStyle(text: String.localized(key: .overlay_learnTutorialMessage),
                              color: UIColor.Greys.black,
                              typography: .header_5,
                              textAlignment: .center)
        beginButton.configure(title: String.localized(key: .overlay_learnTutorialBegin), type: .colored)
        return beginButton.tapPublisher
    }

}
