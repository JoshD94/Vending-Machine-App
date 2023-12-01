////
////  File.swift
////  A4
////
////  Created by 张天逸 on 2023/11/11.
////
//
//import Foundation
//// 这个文件是用于detail page 的 View Controller
//
//// 仍然需要一个返回键
//
//import UIKit
//import SDWebImage
//
//class DetailPage: UICollectionViewCell {
//    var id = UILabel()
//    var descriptionLabel = UILabel()
//    var image = UIImageView()
//    
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        backgroundColor = UIColor.a4.white
//        //layer.cornerRadius = 16
//        //contentView.backgroundColor = UIColor.a4.white
//        
//        setTitle()
//        setDescription()
//        setimage();
//    }
//    
//    // 这个collection view cell是用于在主页面上的每一个单独的菜品
//    
//    required init?(coder: NSCoder){
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configure(with recipe: Recipe) {
//        id.text = recipe.id
//        descriptionLabel.text = recipe.description
//        //image.image = UIImage(recipe.imageUrl)
//    }
//    
//    // set text related things
//private func setTitle(){
//            id.textColor = UIColor.a4.black
//            id.text = ""
//            id.font = .systemFont(ofSize: 16, weight: .semibold)
//    
//            id.translatesAutoresizingMaskIntoConstraints = false
//            contentView.addSubview(id)
//    
//            NSLayoutConstraint.activate([
//                id.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 32),
//                id.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 32)
//            ])
//        }
//    
//        private func setDescription(){
//            descriptionLabel.textColor = UIColor.a4.black
//            descriptionLabel.text = ""
//            descriptionLabel.font = .systemFont(ofSize: 12, weight: .light)
//    
//            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//            contentView.addSubview(descriptionLabel)
//    
//            NSLayoutConstraint.activate([
//                descriptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 77),
//                descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
//            ])
//        }
//    
//        // set image related things
//        private func setimage(){
//            image.image = UIImage(named: "ic-pasta")
//            image.layer.cornerRadius = 16
//    
//            image.translatesAutoresizingMaskIntoConstraints = false
//            contentView.addSubview(image)
//    
//    
//            NSLayoutConstraint.activate([
//                image.widthAnchor.constraint(equalToConstant: 329),
//                image.heightAnchor.constraint(equalToConstant: 329),
//                image.centerXAnchor.constraint(equalTo: centerXAnchor),
//                //image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
//            ])
//        }
//    }
//    
//    
//    
//    
//    
//    
//    
//    
import UIKit
import SDWebImage

class DetailPage: UIViewController {
    private var idLabel = UILabel()
    private var descriptionLabel = UILabel()
    private var imageView = UIImageView()

    var recipe: Recipe?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.a4.white

        setImage()
        setTitle()
        setDescription()
        
        if let recipe = recipe {
            configure(with: recipe)
        }
    }

    func configure(with recipe: Recipe) {
        idLabel.text = recipe.name
        descriptionLabel.text = recipe.description
        imageView.sd_setImage(with: URL(string: recipe.imageUrl))
    }

    private func setTitle() {
        idLabel.textColor = UIColor.a4.black
        idLabel.text = ""
        idLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        idLabel.lineBreakMode = .byWordWrapping
        idLabel.numberOfLines = 0

        idLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(idLabel)

        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            idLabel.widthAnchor.constraint(equalToConstant: 329)
        ])
    }

    private func setDescription() {
        descriptionLabel.textColor = UIColor.a4.silver
        descriptionLabel.text = ""
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .medium)
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 329)
        ])
    }

    private func setImage() {
        imageView.image = UIImage(named: "ic-pasta")
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 329),
            imageView.heightAnchor.constraint(equalToConstant: 329),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120)
        ])
    }
}
