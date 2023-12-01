//
//  ProfileVC.swift
//  A2
//
//  Created by Vin Bui on 6/4/23.
//

import UIKit



class userpage: UIViewController {
    
    // MARK: - Properties (view)
    private let name = UILabel();
    private let balance = UILabel();
    private let image = UIImageView()
    private let button = UIButton()
    private let moneyB = UIButton()
    
    
    // MARK: - Properties (data)
    private var money: Float = 0.0
    private var userrrr: Use? = nil

    
    func fetchUser() {
        NetworkManager.shared.fetchUser { [weak self] recipes in
            guard let self = self else { return }
            
            if let recipes1 = recipes {
                userrrr = recipes1
                money = recipes1.balance
                balance.text = "Balance: $\(money)"
               // self.collectionView.reloadData()
                reloadInputViews()
            } else {
                // Handle error or show an alert
            }
        }
    }

    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Profile"
        view.backgroundColor = UIColor.white
        
        fetchUser()
     //   print("222")
        
        setupImage()
        setupName()
        setupBalance()
        setupTransactionBotton()
        setupMoneyBotton()
        
    }
    
    // MARK: - Set Up Views
    
    func setupTransactionBotton() {
    
        button.setTitle("View Transactions", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.a4.theme
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
           
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 82),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -82),
            button.heightAnchor.constraint(equalToConstant: 48),
            button.bottomAnchor.constraint(equalTo: balance.bottomAnchor, constant: 120),
//            button.widthAnchor.constraint(equalToConstant: 329)
        ])
        
    }
    
    @objc func pushVC(){
//        let selectedMachine = allMachine[indexPath.item]
        let detailPage = transactionpage()
        detailPage.configure(with: userrrr!)
//        detailPage.allTrans = selectedMachine.items
        navigationController?.pushViewController(detailPage, animated: true)
    }
    
    func setupMoneyBotton() {
    
        moneyB.setTitle("Add funds", for: .normal)
        moneyB.setTitleColor(UIColor.white, for: .normal)
        moneyB.backgroundColor = UIColor.a4.theme
        moneyB.layer.cornerRadius = 8
        moneyB.addTarget(self, action: #selector(pushVC2), for: .touchUpInside)
        
        view.addSubview(moneyB)
        moneyB.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
           
            moneyB.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 82),
            moneyB.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -82),
            moneyB.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 32),
            moneyB.heightAnchor.constraint(equalToConstant: 48),
         //   moneyB.bottomAnchor.constraint(equalTo: balance.bottomAnchor, constant: 120),
//            button.widthAnchor.constraint(equalToConstant: 329)
        ])
        
    }
    
    @objc func pushVC2(){
//        let selectedMachine = allMachine[indexPath.item]
        let detailPage = Moneypage()
      //  detailPage.configure(with: userrrr!)
//        detailPage.allTrans = selectedMachine.items
        navigationController?.pushViewController(detailPage, animated: true)
    }
    
    func setupImage(){
        image.image = UIImage(named: "workers")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.layer.cornerRadius = 100
        image.layer.masksToBounds = true
        view.addSubview(image)
        
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 178),
          //  image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 132),
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalToConstant: 200),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        ])
    }
    
    
    func setupName() {
        name.text = "Tianyi Zhang"
        name.textColor = UIColor.black
        name.font = .systemFont(ofSize: 32, weight: .semibold)
        
        view.addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupBalance() {
        balance.text = "$\(money)"
        balance.textColor = UIColor.black
        
        balance.font = .systemFont(ofSize: 18, weight: .regular)
        
        view.addSubview(balance)
        balance.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            balance.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 14),
            balance.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    
}

//extension ProfileVC: updatePage {
//
//    func update(newHometown: String, newMajor: String){
//        hometown1 = newHometown
//        major1 = newMajor
//        hometown.text = newHometown
//        major.text = newMajor
//    }

//}

