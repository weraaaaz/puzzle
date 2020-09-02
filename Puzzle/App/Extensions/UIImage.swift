//
//  UIImage.swift
//  Puzzle
//
//  Created by dev on 20/08/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func cropped(rect: CGRect, imageViewWidth: CGFloat, imageViewHeight: CGFloat) -> UIImage?
    {
        let imageViewScale = max(self.size.width / imageViewWidth, self.size.height / imageViewHeight)

        let cropZone = CGRect(x: rect.origin.x * imageViewScale,
                              y: rect.origin.y * imageViewScale,
                              width: rect.size.width * imageViewScale,
                              height: rect.size.height * imageViewScale)

        guard let cropImageRef: CGImage = self.cgImage?.cropping(to: cropZone)
            else {
                return nil
        }

        let croppedImage: UIImage = UIImage(cgImage: cropImageRef)
        return croppedImage
    }
}
