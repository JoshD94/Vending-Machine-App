////
////  RecipeDetailViewController.swift
////  A4
////
////  Created by 张天逸 on 2023/11/11.
////
//
//import Foundation
//import UIKit
//import SDWebImage
//
//class RecipeDetailViewController: UIViewController {
////
////    @IBOutlet weak var image: UIImageView!
////    @IBOutlet weak var titleLabel: UILabel!
////    @IBOutlet weak var descriptionLabel: UILabel!
//    //private weak var delegate : updatePage?
//    private var image: UIImageView
//    private var titleLabel: UILabel
//    private var descriptionLabel: UILabel
//    
//    init(recipe: Recipe) {
//        
//        self.recipe = recipe
//        //self.image = image
//       // self.image.sd_setImage(with: URL(String: image1))
//        self.image.sd_setImage(with: URL(string: recipe.imageUrl!))
//        self.titleLabel.text = recipe.name
//        self.descriptionLabel.text = descriptionLabel
////        //self.recipe = recipe
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
////
////    var recipe: Recipe?
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        if let recipe = recipe {
////            titleLabel.text = recipe.id
////            descriptionLabel.text = recipe.description
////            recipeImageView.sd_setImage(with: URL(string: recipe.imageUrl))
////        }
////    }
//    
////    var id = UILabel()
////    var descriptionLabel = UILabel()
////    var image = UIImageView()
//    var recipe: Recipe?
//
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if let recipe = recipe {
//            titleLabel.text = recipe.id
//            descriptionLabel.text = recipe.description
//            image.sd_setImage(with: URL(string: recipe.imageUrl))
//        }
//        
//        setimage();
//        setTitle()
//        setDescription()
//        
//    }
//    
//    
//    // set text related things
//    private func setTitle(){
//        titleLabel.textColor = UIColor.a4.black
//        titleLabel.text = ""
//        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
//        
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(titleLabel)
//        
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 32),
//            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32)
//        ])
//    }
//    
//    private func setDescription(){
//        descriptionLabel.textColor = UIColor.a4.black
//        descriptionLabel.text = ""
//        descriptionLabel.font = .systemFont(ofSize: 12, weight: .light)
//        
//        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(descriptionLabel)
//        
//        NSLayoutConstraint.activate([
//            descriptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 77),
//            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
//        ])
//    }
//    
//    // set image related things
//    private func setimage(){
//        image.image = UIImage(named: "ic-pasta")
//        image.layer.cornerRadius = 16
//        
//        image.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(image)
//        
//        
//        NSLayoutConstraint.activate([
//            image.widthAnchor.constraint(equalToConstant: 329),
//            image.heightAnchor.constraint(equalToConstant: 329),
//            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            //image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
//        ])
//    }
//}
