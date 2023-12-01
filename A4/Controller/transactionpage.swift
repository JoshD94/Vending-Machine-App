
// RecipeCollectionViewController.swift
import UIKit

class transactionpage: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView!
  //  private let refresh = UIRefreshControl()
    
    var allTrans: [Transaction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.a4.offWhite
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        setupCollectionView();
        title = "Transactions"
    //    let a = allTrans.first?.item_id
   //     print(a)
      //  fetchTransss()
        
   
//        title = "Vending Machines"
        
    }
    
//    func fetchTransss() {
//        NetworkManager.shared.fetchTrans { [weak self] recipes in
//            guard let self = self else { return }
//
//            if let recipes1 = recipes {
//                self.allTrans = recipes1
//                self.collectionView.reloadData()
//            } else {
//                // Handle error or show an alert
//            }
//        }
//    }
    
    func configure(with user111: Use) {
        allTrans = user111.transactions
    }
    
    
    func setupCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16 // (optional) spacing amount
        layout.minimumInteritemSpacing = 16
        
        layout.sectionInset = UIEdgeInsets(top: 20, left: 12, bottom: 32, right: 12)
        //        let screenWidth = UIScreen.main.bounds.width
        //        let numberOfColumns: CGFloat = 2
        //        let cellWidth = (screenWidth - (numberOfColumns + 1) * layout.minimumLineSpacing) / numberOfColumns
        //        layout.itemSize = CGSize(width: cellWidth, height: 216)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TransactionCollectionCell.self, forCellWithReuseIdentifier: TransactionCollectionCell.reuse)
        //collectionView.backgroundColor = UIColor.a4.yellowOrange
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        
//        refresh.addTarget(self, action: #selector(collectionView(UICollectionView, cellForItemAt: IndexPath)), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.collectionView){
//            print("items: count")
            return allTrans.count
        }
        
        return 0
    }
    //
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
//                print("recipe: cellforitem")
                
                let trans = allTrans[indexPath.item]
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TransactionCollectionCell.reuse, for: indexPath) as? TransactionCollectionCell{
                    cell.configure(with: trans)
          //          print("hhh"+trans.time)
                    return cell

            }
            return UICollectionViewCell()
        }
    
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if (collectionView == self.collectionView){
                let width = collectionView.frame.width - 40
                return CGSize(width: width, height: 80)
            }
            return CGSize(width: 1, height: 1 + 70)
        }
        
//        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//           if (collectionView == self.collectionView){
//                let selectedMachine = allTrans[indexPath.item]
//                let detailPage = transactionpage()
//                detailPage. = selectedMachine
//                navigationController?.pushViewController(detailPage, animated: true)
//            }
//        }
        
    
    }
    

