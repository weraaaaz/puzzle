//
//  SelectGridViewController.swift
//  Puzzle
//
//  Created by dev on 28/07/2020.
//  Copyright © 2020 Weronika Żywiecka. All rights reserved.
//

import UIKit

class SelectGridViewController: UIViewController, UINavigationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate  {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageBlurView: UIImageView!
    @IBOutlet weak var decreaseCountButton: UIButton!
    @IBOutlet weak var increaseCountButton: UIButton!
    @IBOutlet weak var gridCountLabel: UILabel!
    @IBOutlet weak var gridView: UICollectionView!
    @IBOutlet weak var imageScrollView: UIScrollView!

    var image = UIImage()

    var gridCount = 6
    var puzzleCells:Array<Int> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        imageBlurView.contentMode = UIView.ContentMode.scaleAspectFill
        imageBlurView.image = self.image
        imageScrollView.minimumZoomScale = 0.8
        imageScrollView.maximumZoomScale = 5.0
        self.createBlurOverlay()
        decreaseCountButton.roundCorners([.topLeft, .bottomLeft], radius: 8)
        increaseCountButton.roundCorners([.topRight, .bottomRight], radius: 8)
        decreaseCountButton.setTitleColor(UIColor.countButtonDisabledText, for: UIControl.State.disabled)
        increaseCountButton.setTitleColor(UIColor.countButtonDisabledText, for: UIControl.State.disabled)
        let cellsCount = gridCount * gridCount
        for i in 1...cellsCount {
            puzzleCells.append(i)
        }
    }

    func createBlurOverlay() {
        let blur = BlurVisualEffectView()
        blur.frame = self.view.frame
        self.view.insertSubview(blur, at: 1)
        let path = UIBezierPath(rect: self.view.frame)
        let grid = UIBezierPath(rect: self.gridView.frame)
        path.append(grid)
        path.usesEvenOddFillRule = true
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
        blur.layer.mask = maskLayer
    }
    
    func assignDependencies(image: UIImage) {
        self.image = image
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.puzzleCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gridView.dequeueReusableCell(withReuseIdentifier: "gridCell", for: indexPath as IndexPath) as! GridViewCell
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width - 2) / CGFloat(self.gridCount)
        return CGSize(width: width, height: width)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageBlurView
    }
    
    @IBAction func onDecreaseButtonTap(_ sender: Any) {
        if (self.gridCount > 4) {
            let numberOfCellsToRemove = (self.gridCount * self.gridCount) - ((self.gridCount - 1) * (self.gridCount - 1))
            self.gridCount = self.gridCount - 1
            self.gridCountLabel.text = "Current Grid Size = \(self.gridCount)"
            DispatchQueue.main.async {
                for _ in 1...numberOfCellsToRemove {
                    self.puzzleCells.removeLast()
                }
                self.gridView.reloadData()
            }
        }
        if (self.gridCount == 4) {
            self.decreaseCountButton.isEnabled = false
        } else if (self.gridCount == 7) {
            self.increaseCountButton.isEnabled = true
        }
    }
    
    @IBAction func onIncreaseButtonTap(_ sender: Any) {
        if (self.gridCount < 8) {
            let numberOfCellsToAdd = ((self.gridCount + 1) * (self.gridCount + 1)) - self.gridCount * self.gridCount
            self.gridCount = self.gridCount + 1
            self.gridCountLabel.text = "Current Grid Size = \(self.gridCount)"
            DispatchQueue.main.async {
                for _ in 1...numberOfCellsToAdd {
                    self.puzzleCells.append(self.puzzleCells.count + 1)
                }
                self.gridView.reloadData()
            }
        }
        if (self.gridCount == 8) {
            self.increaseCountButton.isEnabled = false
        } else if (self.gridCount == 5) {
            self.decreaseCountButton.isEnabled = true
        }
    }

}
