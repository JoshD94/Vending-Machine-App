//
//  Moneypage.swift
//  A4
//
//  Created by Library User on 11/30/23.
//

import Foundation
import UIKit

class Moneypage: UIViewController {
    
    private let add = UITextField()
    private let info = UILabel()
    private let button = UIButton()
    
    private var money: Float = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Funds"
        view.backgroundColor = UIColor.white
        
        setupInfo()
        setupAdd()
        setBuy()
    
    }
    
    func setupInfo() {
        info.text = "Enter Amount"
        info.textColor = UIColor.a4.theme
        info.font = .systemFont(ofSize: 32, weight: .regular)
        
        view.addSubview(info)
        info.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //info.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            info.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -45),
            info.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupAdd() {
        add.text = "\(money)"
        add.textAlignment = .center
        add.textColor = UIColor.a4.black
        add.layer.borderWidth = 3
        add.layer.borderColor = UIColor.a4.theme.cgColor
        add.layer.cornerRadius = 8
        add.font = .systemFont(ofSize: 30, weight: .regular)
        
        view.addSubview(add)
        add.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            add.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 15),
            //add.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -45),
            add.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            add.widthAnchor.constraint(equalToConstant: 230),
            add.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setBuy() {
        button.setTitle("Add", for: .normal)
        button.backgroundColor = UIColor.a4.theme
        button.layer.cornerRadius = 8
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.addTarget(self, action: #selector(createPost22), for: .touchUpInside)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //buy.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button.topAnchor.constraint(equalTo: add.bottomAnchor, constant: 30),
            button.widthAnchor.constraint(equalToConstant: 236),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
//            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
           // button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            buy.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            //         buy.widthAnchor.constraint(equalToConstant: 96),
            button.heightAnchor.constraint(equalToConstant: 48),
            //buy.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 32)
        ])
    }
    
    private func showFailedAlert() -> Float {
        let alert = UIAlertController(title: "Add Failed", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        return 0.0
    }
    
    @objc private func createPost22(){
        money = Float(add.text!) ?? showFailedAlert()
        let newPost = Addmoney(amount: money)
        
        NetworkManager.shared.addMM(money1: newPost) { [weak self] post in
            if post {
                let alert = UIAlertController(title: "Added successfully", message: "", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
                // Do something if the call succeeded
            } else {
                let alert = UIAlertController(title: "Add Failed", message: "", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }
            // Unwrap a strong reference
            guard let self = self else { return }
          //  print("Successfully add \(name)")
            
            // Do something with the data
            
            // DispatchQueue.main.async {
            // Perform UI updates
        }
    }
    
}
