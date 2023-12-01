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

class TransactionCollectionCell: UICollectionViewCell {
//    private let id = UILabel()
    private let location = UILabel()
    private let item = UILabel()
    private let time = UILabel()
    private let image = UIImageView()

    static let reuse = "Reuse"
    
    private var itemID = ""
    private var machineID = ""

    
    private var itemName : String = ""
    private var machineName : String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.a4.white
        layer.cornerRadius = 8
        contentView.backgroundColor = UIColor.a4.white
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        
//        print("hhh"+itemID)

        setImage()
        setItem()
        setLocation()
        setTime()
        

    //    print("idid"+itemID)
//        fetchItem1()
        //fetchMachine1()
        
    }
    
    func fetchItem1() {
        NetworkManager.shared.fetchItem(with: itemID) { [weak self] recipes in
            guard let self = self else { return }

            if let recipes1 = recipes {
                self.itemName = recipes1.name
//                print("hhh333"+itemName)
                item.text = "$\(recipes1.price)  \(itemName)"
//                self.collectionView.reloadData()
                image.sd_setImage(with: URL(string: recipes1.image_url))
            } else {
                // Handle error or show an alert
            }
        }
    }
    
    func fetchMachine2() {
        NetworkManager.shared.fetchMachine(machineN: machineID) { [weak self] recipes in
            guard let self = self else { return }

            if let recipes1 = recipes {
                self.machineName = recipes1.location
//                print("hhh333"+itemName)
                location.text = machineName
//                self.collectionView.reloadData()
            } else {
                // Handle error or show an alert
            }
        }
    }
    
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with trans222: Transaction) {
//        id.text = machine222.id
//        location.text = trans222.location
//        image.sd_setImage(with: URL(string: "\(machine222.image_url)"))
        itemID = "\(trans222.item_id)"
        machineID = "\(trans222.machine_id)"
   //     item.text = "itemID is \(trans222.item_id)"
   //     location.text = "MachineID is \(trans222.machine_id)"
        
        let str = trans222.time
       // let newStr = str[..<12]
        let index = str.index(of: " ")!
        let newStr = str.substring(to: index)
        time.text = newStr

        fetchItem1()
        fetchMachine2()
  //      print("configure: "+itemID)
        
    }
    
    private func setImage(){
        //image.image = UIImage(named: "ic-pasta")
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        //let sidePadding: CGFloat = 1
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 70),
            image.heightAnchor.constraint(equalToConstant: 70),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
          //  image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])
    }
    
    // set text related things
    private func setItem(){
        item.textColor = UIColor.black
        item.font = .systemFont(ofSize: 18, weight: .semibold)
        item.lineBreakMode = .byWordWrapping
        item.numberOfLines = 0
        
        item.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(item)
        
        NSLayoutConstraint.activate([
            item.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            item.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
//            id.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: 0),
//            id.widthAnchor.constraint(lessThanOrEqualToConstant: 128)
     //       payment.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            //item.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func setLocation(){
        location.textColor = UIColor.gray
        //descriptionLabel.text = ""
        location.font = .systemFont(ofSize: 15, weight: .light)
        //descriptionLabel.numberOfLines = 1
        
        location.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(location)
        
        NSLayoutConstraint.activate([
       //     location.topAnchor.constraint(equalTo: item.bottomAnchor, constant: 2),
            location.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

         //   location.leadingAnchor.constraint(equalTo: item.leadingAnchor, constant: 0),
            location.bottomAnchor.constraint(equalTo: item.topAnchor, constant: -3)
       //     location.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
      //      location.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setTime(){
        time.textColor = UIColor.a4.black
        //descriptionLabel.text = ""
        time.font = .systemFont(ofSize: 12, weight: .regular)
        //descriptionLabel.numberOfLines = 1
        
        time.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(time)
        
        NSLayoutConstraint.activate([
            //     time.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 3),
      //      location.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 10),
            time.bottomAnchor.constraint(equalTo: location.topAnchor, constant: -3),

            time.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
       //     time.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    // set image related things
//    private func setimage(){
//        //image.image = UIImage(named: "ic-pasta")
//        image.layer.cornerRadius = 16
//        image.contentMode = .scaleAspectFill
//        image.clipsToBounds = true
//
//        image.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(image)
//        //let sidePadding: CGFloat = 1
//        NSLayoutConstraint.activate([
//            image.widthAnchor.constraint(equalToConstant: 148),
//            image.heightAnchor.constraint(equalToConstant: 220),
//            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
//            //image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: sidePadding),
//            //image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -sidePadding)
//        ])
//    }
    
    
}
