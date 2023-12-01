
// RecipeCollectionViewController.swift
import UIKit

class sunpage: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var collectionView: UICollectionView!
    private var refresh = UIRefreshControl()
    
    private var location = ""
    
    var allItems: [item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.a4.offWhite
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        setupCollectionView();
   
        self.collectionView.refreshControl?.endRefreshing()

        
    }
    
    func configure(with machine111: machine) {
        allItems = machine111.items
        self.location = machine111.location
        title = machine111.location
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
        collectionView.register(ItemCollectionCell.self, forCellWithReuseIdentifier: ItemCollectionCell.reuse)
        //collectionView.backgroundColor = UIColor.a4.yellowOrange
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        
        refresh.addTarget(self, action: #selector(viewDidLoad), for: .valueChanged)
        collectionView.refreshControl = refresh
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
//        title = location

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.collectionView){
//            print("items: count")
            return allItems.count
        }
        
        return 0
    }
    //
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
//                print("recipe: cellforitem")
                
                let item = allItems[indexPath.item]
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionCell.reuse, for: indexPath) as? ItemCollectionCell{
                    cell.configure(with: item)
                    return cell

            }
            return UICollectionViewCell()
        }
    
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if (collectionView == self.collectionView){
                let width = collectionView.frame.width / 2 - 50
                return CGSize(width: width, height: width + 70)
            }
            return CGSize(width: 1, height: 1 + 70)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           if (collectionView == self.collectionView){
//                print("recipe: did select")
                let selectedMachine = allItems[indexPath.item]
                let detailPage = buy()
                detailPage.item = selectedMachine
                navigationController?.pushViewController(detailPage, animated: true)
            }
        }
        
    
    }
    

