
//
//
import UIKit
import SDWebImage
import SwiftUI

class buy: UIViewController {
    private var name = UILabel()
    private var picture = UIImageView()
    private var price = UILabel()
    private var buy = UIButton()
    //private var
    
    var user_id1 = 1
    var machine_id1 = 0
    var item_id1 = 0
    var item: item?
    var name11 = ""
    
    @State private var showingFailAlert = false
    @State private var showingSuccessAlert = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.a4.white
        
        setImage()
        setTitle()
        setDescription()
        setBuy()
        
        if let item = item {
            configure(with: item)
        }
    }
    
    func configure(with item333: item) {
        name.text = item333.name
        name11 = item333.name
        price.text = "$\(item333.price)"
        picture.sd_setImage(with: URL(string: item333.image_url))
        self.item_id1 = item333.id
        self.machine_id1 = item333.machine_id
    }
    
    private func setTitle() {
        name.textColor = UIColor.a4.black
        name.text = ""
        name.font = .systemFont(ofSize: 24, weight: .semibold)
        name.lineBreakMode = .byWordWrapping
        name.numberOfLines = 0
        
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 32),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            name.widthAnchor.constraint(equalToConstant: 329)
        ])
    }
    
    private func setDescription() {
        price.textColor = UIColor.black
        price.text = ""
        price.font = .systemFont(ofSize: 20, weight: .semibold)
        price.lineBreakMode = .byWordWrapping
        price.numberOfLines = 0
        
        price.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(price)
        
        NSLayoutConstraint.activate([
            price.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            price.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            price.widthAnchor.constraint(equalToConstant: 329)
        ])
    }
    
    private func setImage() {
        picture.image = UIImage(named: "ic-pasta")
        picture.layer.cornerRadius = 16
        picture.contentMode = .scaleAspectFill
        picture.clipsToBounds = true
        
        picture.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picture)
        
        NSLayoutConstraint.activate([
            picture.widthAnchor.constraint(equalToConstant: 329),
            picture.heightAnchor.constraint(equalToConstant: 329),
            picture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picture.topAnchor.constraint(equalTo: view.topAnchor, constant: 170)
        ])
    }
    
    private func setBuy() {
        buy.setTitle("Buy", for: .normal)
        buy.backgroundColor = UIColor.a4.theme
        buy.layer.cornerRadius = 8
        buy.setTitleColor(UIColor.white, for: .normal)
        buy.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        buy.addTarget(self, action: #selector(createPost11), for: .touchUpInside)
        
        view.addSubview(buy)
        buy.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //buy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buy.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 20),
            buy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            buy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            buy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            buy.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            //         buy.widthAnchor.constraint(equalToConstant: 96),
            buy.heightAnchor.constraint(equalToConstant: 42),
            //buy.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 32)
        ])
    }
    
    
    
    @objc private func createPost11(){
        
        let newPost = CreatePost(user_id: user_id1, machine_id: machine_id1, item_id: item_id1)
        
        NetworkManager.shared.createPost33(post: newPost) { [weak self] post in
            if post {
                print("success")
                let alert = UIAlertController(title: "Transaction successful", message: "", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
                // Do something if the call succeeded
            } else {
                let alert = UIAlertController(title: "Transaction failed", message: "Insufficient funds", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }
            // Unwrap a strong reference
            guard let self = self else { return }
            print("Successfully add \(name)")
            
            // Do something with the data
            
            // DispatchQueue.main.async {
            // Perform UI updates
        }
    }
}
//    @objc func createPost() {
//        // TODO: Send a POST request to create a post
//
//        //delegate?.didTapPostButton(with: text)
//        reloadInputViews()
//        //ending()
//
//
//        let parameters : CreatePost = [
//            "user_id" : 1,
//            "machine_id" : item!.machine_id,
//            "item_id" : item!.id
//        ]
//
//    }
//
//    //        NetworkManager.shared.addRoster(box: newBox) { [weak self] box in
//    //            guard let self = self else {return}
//    //            print("\(newBox) was added.")
//    //        }
//
//    NetworkManager.shared.createPost(parameters: parameters) { success in
//        if success {
//            // Optional: Clear the textfield if the call is successful
//            self.textField.text = ""
//        } else {
//            // Handle the case where the POST request failed
//            // You can show an alert or update the UI accordingly
//            print("Failed to create the post")
//        }
//    }



