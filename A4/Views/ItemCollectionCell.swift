//
//  RecipeCollectionViewCell.swift
//  A4
//
//  Created by 张天逸 on 2023/11/11.
//

import Foundation
// RecipeCollectionViewCell.swift
import UIKit
import SDWebImage

class ItemCollectionCell: UICollectionViewCell {
    private let id = UILabel()
    private let quantity = UILabel()
    private let price = UILabel()
    private let image = UIImageView()

    static let reuse = "Reuse"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.a4.white
        layer.cornerRadius = 16
        contentView.backgroundColor = UIColor.a4.white
        
        setimage()
        setTitle()
        setPrice()
        setQuantity()
        //self.reuseIdentifier = reuse

    }
    
    // 这个collection view cell是用于在主页面上的每一个单独的菜品
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item222: item) {
        id.text = item222.name
        quantity.text = "\(item222.quantity) left"
        price.text = "$\(item222.price)"
        image.sd_setImage(with: URL(string: item222.image_url))
    }
    
    // set text related things
    private func setTitle(){
        id.textColor = UIColor.a4.black
        id.font = .systemFont(ofSize: 16, weight: .semibold)
        id.lineBreakMode = .byWordWrapping
        id.numberOfLines = 0
        
        id.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(id)
        
        NSLayoutConstraint.activate([
            id.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 0),
            id.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 0),
//            id.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: 0),
//            id.widthAnchor.constraint(lessThanOrEqualToConstant: 128)
            id.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setPrice(){
        price.textColor = UIColor.a4.black
        price.font = .systemFont(ofSize: 16, weight: .semibold)
        price.lineBreakMode = .byWordWrapping
        price.numberOfLines = 0
        
        price.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(price)
        
        NSLayoutConstraint.activate([
            price.topAnchor.constraint(equalTo: id.bottomAnchor, constant: 0),
            price.leadingAnchor.constraint(equalTo: id.leadingAnchor, constant: 0),
            price.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setQuantity(){
        quantity.textColor = UIColor.a4.silver
        //descriptionLabel.text = ""
        quantity.font = .systemFont(ofSize: 14, weight: .regular)
        //descriptionLabel.numberOfLines = 1
        
        quantity.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(quantity)
        
        NSLayoutConstraint.activate([
            quantity.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 4),
            quantity.leadingAnchor.constraint(equalTo: price.leadingAnchor, constant: 0),
            quantity.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    // set image related things
    private func setimage(){
        //image.image = UIImage(named: "ic-pasta")
        image.layer.cornerRadius = 16
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        //let sidePadding: CGFloat = 1
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 148),
            image.heightAnchor.constraint(equalToConstant: 148),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
        ])
    }
    
    
}
