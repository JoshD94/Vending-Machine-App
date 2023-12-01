//
//  UIcollectionViewCell.swift
//  A4
//
//  Created by 张天逸 on 2023/11/11.
//

import Foundation

// RecipeCollectionViewCell.swift
import UIKit
import SDWebImage

class RecipeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    func configure(with recipe: Recipe) {
        titleLabel.text = recipe.title
        titleLabel.numberOfLines = 2
        imageView.sd_setImage(with: URL(string: recipe.imageUrl))
    }
}
