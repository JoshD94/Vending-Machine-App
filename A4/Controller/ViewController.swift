
// RecipeCollectionViewController.swift
import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView!
    private var refresh = UIRefreshControl()
    
    var allMachine: [machine] = []
    
    @objc func user(){
       // let selectedMachine = allMachine[indexPath.item]
        let detailPage = userpage()
     //   detailPage.allItems = selectedMachine.items
        navigationController?.pushViewController(detailPage, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.a4.offWhite
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true

        
      //  navigationController?.navigationBar.barTintColor = .purple
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.topItem?.titleView?.subviews.forEach({ view in
            if let label = view as? UILabel {
                label.textColor = .white
            }
        })
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.subviews.forEach({ subview in
            if NSStringFromClass(subview.classForCoder).contains("UINavigationBarLargeTitleView") {
                subview.subviews.forEach { view in
                    if let label = view as? UILabel {
                        label.textColor = .white
                    }
                }
            }
        })
        
        navigationController?.navigationBar.subviews.forEach({ view in
            if let label = view as? UILabel {
                label.textColor = .white
            }
        })
        
        let button = UIButton()
        button.addTarget(self, action: #selector(user), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
       // button.layer.borderColor = UIColor.gray.cgColor
        button.clipsToBounds = true
        
        navigationController?.navigationBar.addSubview(button)
        button.setImage(UIImage(named: "workers"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        navigationController?.navigationBar.backgroundColor = UIColor.a4.theme
        
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: (navigationController?.navigationBar.trailingAnchor)!, constant: -8),
            button.centerYAnchor.constraint(equalTo: (navigationController?.navigationBar.centerYAnchor)!,constant: -8),
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            image: UIImage(named: "icon"),
//            style: .plain,
//            target: self,
//            action: #selector(user)
//        )
        
        
        setupCollectionView();
        
        title = "Cornell Vending"
        
        
        fetchMachines()
        changeNavBar(navigationBar: navigationController!.navigationBar, to: UIColor.a4.theme)

        
    }
    
    func changeNavBar(navigationBar: UINavigationBar, to color: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = color
        navigationBar.standardAppearance = appearance;
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
    }
    
    @objc func fetchMachines() {
        NetworkManager.shared.fetchMachines { [weak self] recipes in
            guard let self = self else { return }
            
            if let recipes1 = recipes {
                self.allMachine = recipes1
                self.collectionView.reloadData()
                
            } else {
                // Handle error or show an alert
            }
            self.collectionView.refreshControl?.endRefreshing()

        }
    }
    
    
    func setupCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16 // (optional) spacing amount
        layout.minimumInteritemSpacing = 16
        
        layout.sectionInset = UIEdgeInsets(top: 20, left: 32, bottom: 32, right: 32)
        //        let screenWidth = UIScreen.main.bounds.width
        //        let numberOfColumns: CGFloat = 2
        //        let cellWidth = (screenWidth - (numberOfColumns + 1) * layout.minimumLineSpacing) / numberOfColumns
        //        layout.itemSize = CGSize(width: cellWidth, height: 216)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MachineCollectionViewCell.self, forCellWithReuseIdentifier: MachineCollectionViewCell.reuse)
        //collectionView.backgroundColor = UIColor.a4.yellowOrange
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
//        collectionView.backgroundColor = UIColor.a4.theme
        
        refresh.addTarget(self, action: #selector(fetchMachines), for: .valueChanged)
        collectionView.refreshControl = refresh
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.collectionView){
//            print("recipe: count")
            return allMachine.count
        }
        
        return 0
    }
    //
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        print("recipe: cellforitem")
        
        let machines = allMachine[indexPath.item]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MachineCollectionViewCell.reuse, for: indexPath) as? MachineCollectionViewCell{
            cell.configure(with: machines)
            return cell
            
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == self.collectionView){
//            print("recipe: size for item")
            let width = collectionView.frame.width / 2 - 50
            return CGSize(width: width, height: width + 115)
        }
        return CGSize(width: 1, height: 1 + 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == self.collectionView){
            //print("recipe: did select")
            let selectedMachine = allMachine[indexPath.item]
            let detailPage = sunpage()
            detailPage.allItems = selectedMachine.items
            let machines = allMachine[indexPath.item]
            detailPage.configure(with: machines)
            navigationController?.pushViewController(detailPage, animated: true)
        }
    }
    
    
}


