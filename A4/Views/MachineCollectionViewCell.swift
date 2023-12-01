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

class MachineCollectionViewCell: UICollectionViewCell {
//    private let id = UILabel()
    private let location = UILabel()
    private let image = UIImageView()
    private let payment = UILabel()

    static let reuse = "Reuse"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.a4.white
        layer.cornerRadius = 10
        contentView.backgroundColor = UIColor.a4.white
        
        setimage()
        setDescription()
        setPayment()

    }
    
    // 这个collection view cell是用于在主页面上的每一个单独的菜品
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with machine222: machine) {
//        id.text = machine222.id
        location.text = machine222.location
        image.sd_setImage(with: URL(string: "\(machine222.image_url)"))
       // print("\(machine222.image_url)")
        var pay = ""
        if (machine222.takes_brbs){
            pay += "brbs   "
        }
        if (machine222.takes_card){
            pay += "card   "
        }
        if (machine222.takes_cash){
            pay += "cash   "
        }
        payment.text = pay
        
    }
    
    // set text related things
    private func setPayment(){
        payment.textColor = UIColor.a4.theme
        payment.font = .systemFont(ofSize: 12, weight: .regular)
        payment.lineBreakMode = .byWordWrapping
        payment.numberOfLines = 0
        
        payment.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(payment)
        
        NSLayoutConstraint.activate([
            payment.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 2),
 //           payment.leadingAnchor.constraint(equalTo: location.leadingAnchor, constant: 0),
//            id.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: 0),
//            id.widthAnchor.constraint(lessThanOrEqualToConstant: 128)
     //       payment.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            payment.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setDescription(){
        location.textColor = UIColor.a4.black
        //descriptionLabel.text = ""
        location.font = .systemFont(ofSize: 16, weight: .semibold)
        //descriptionLabel.numberOfLines = 1
        
        location.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(location)
        
        NSLayoutConstraint.activate([
            location.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 3),
      //      location.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 10),
            location.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    // set image related things
    private func setimage(){
        //image.image = UIImage(named: "ic-pasta")
        image.layer.cornerRadius = 8
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        //let sidePadding: CGFloat = 1
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 148),
            image.heightAnchor.constraint(equalToConstant: 220),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            //image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sidePadding),
            //image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sidePadding)
        ])
    }
    
    
}
