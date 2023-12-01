//
//// RecipeCollectionViewController.swift
//import UIKit
//
//class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    
//    
//    
//    
//    private var collectionView: UICollectionView!
//    private var filter: UICollectionView!
//    
//    var allRecipes: [Recipe] = []
//    var filteredRecipes: [Recipe] = []
//    var filters: [String] = ["All", "Beginner", "Intermediate", "Advanced"]
//    var selectedFilterIndex: Int = 0
//
//    
//
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = UIColor.a4.offWhite
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
//        
//        
//      //  setupFilterView()
//        setupCollectionView();
//        
//        setupFilterView()
//        title = "ChefOS"
//
//        fetchRecipes()
//        
//        
//    }
//    
//    func fetchRecipes() {
//        NetworkManager.shared.fetchRecipes { [weak self] recipes in
//            guard let self = self else { return }
//            
//            if let recipes = recipes {
//                self.allRecipes = recipes
//                self.filteredRecipes = recipes
//                self.collectionView.reloadData()
//            } else {
//                // Handle error or show an alert
//            }
//        }
//    }
//    
//    func setupFilterView(){
//        
//        filteredRecipes = allRecipes
//        let filterLayout = UICollectionViewFlowLayout()
//        filterLayout.scrollDirection = .horizontal
//        filterLayout.minimumInteritemSpacing = 12
//        filterLayout.minimumLineSpacing = 16 // (optional) spacing amount
//        
//        let top1 = 140
//        filterLayout.sectionInset = UIEdgeInsets(top: CGFloat(top1), left: 28, bottom: 0, right: 32)
//     //   filterLayout.sectionInset = UIEdgeInsets(top: 140, left: 28, bottom: 0, right: 32)
//        
//        filter = UICollectionView(frame: .zero, collectionViewLayout: filterLayout)
//        filter.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.reuse)
//        filter.delegate = self
//        filter.dataSource = self
//   //     filter.backgroundColor = UIColor.red
//        
////        let title1 = UILabel()
////        title1.text = "ChefOS"
////        title1.font = .systemFont(ofSize: 32, weight: .semibold)
//
//        view.addSubview(filter)
//        filter.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            filter.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
//            filter.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            filter.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            //filter.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            filter.heightAnchor.constraint(equalToConstant: CGFloat(top1+50))
//            //filter.heightAnchor.constraint(equalToConstant: 480) // Set the desired height
//        ])
//        
//        filter.alwaysBounceHorizontal = true
//        filter.reloadData()
//        filter.isUserInteractionEnabled = true
////        let indexPath = IndexPath(item: 0, section: 0) // or any other valid index path
////        filter.selectItem(at: indexPath, animated: false, scrollPosition: [])
//        //view.bringSubviewToFront(filter)
//        filter.showsHorizontalScrollIndicator = false
//
//    }
//    
//    func setupCollectionView(){
//        
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 16 // (optional) spacing amount
//        layout.minimumInteritemSpacing = 16
//        
//        layout.sectionInset = UIEdgeInsets(top: 70, left: 32, bottom: 32, right: 32)
//        //        let screenWidth = UIScreen.main.bounds.width
//        //        let numberOfColumns: CGFloat = 2
//        //        let cellWidth = (screenWidth - (numberOfColumns + 1) * layout.minimumLineSpacing) / numberOfColumns
//        //        layout.itemSize = CGSize(width: cellWidth, height: 216)
//        
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: RecipeCollectionViewCell.reuse)
//        //collectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.reuse)
//        //collectionView.backgroundColor = UIColor.a4.yellowOrange
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        
//        view.addSubview(collectionView)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.alwaysBounceVertical = true
//        
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//        filteredRecipes = allRecipes
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == filter {
//            print("filter: count")
//            return filters.count
//        } else if (collectionView == self.collectionView){
//            print("recipe: count")
//            return allRecipes.count
//        }
//        
//        return 0
//    }
//    //
//        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            if collectionView == filter {
//                print("filter: cellforitem")
//                let fil = filters[indexPath.item]
//                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.reuse, for: indexPath) as? FilterCollectionViewCell {
//                   // cell.configure(with: fil)
//                    //cell.filterButton.setTitle(filter.filters[indexPath.item], for: .normal)
//                    cell.configure(with: fil)
////                    cell.delegate = self
////                    cell.setSelectionState(selected: indexPath.item == selectedFilterIndex)
//                    return cell
//                }
//                
//            } else if (collectionView == self.collectionView){
//                print("recipe: cellforitem")
//                
//                let recipes = allRecipes[indexPath.item]
//                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.reuse, for: indexPath) as? RecipeCollectionViewCell{
//                    cell.configure(with: recipes)
//                    return cell
//                }
////                guard indexPath.item < filteredRecipes.count else {
////                    // Handle the case where the index is out of bounds
////                    print("Index out of range for filteredRecipes")
////                    return UICollectionViewCell()
////                }
////
////                let recipes = filteredRecipes[indexPath.item]
////                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.reuse, for: indexPath) as? RecipeCollectionViewCell {
////                    cell.configure(with: recipes)
////                    return cell
////                }
//            }
//            return UICollectionViewCell()
//        }
//    
//        
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            if (collectionView == filter) {
//                print("filter: sizeforitem")
//                return CGSize(width: 116, height: 32)
//            } else if (collectionView == self.collectionView){
//                print("recipe: size for item")
//                let width = collectionView.frame.width / 2 - 50
//                return CGSize(width: width, height: width + 70)
//            }
//            return CGSize(width: 1, height: 1 + 70)
//        }
//        
//        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            if (collectionView == filter) {
//                print("filter: didselect!!!!!!!!!1")
//                let selectedFilter = filters[indexPath.item]
//                
//                if selectedFilter == "ALL"{
//                    filteredRecipes = allRecipes
//                    
//                } else {
//                    filteredRecipes = allRecipes.filter {$0.difficulty == selectedFilter}
//                }
//                print("33333Filtered Recipes: \(filteredRecipes)")
//                // Reload the filter collection view data
//                self.filter.reloadData()
//                self.collectionView.reloadData()
//                // filterRecipes(with: selectedFilter)
//                // TODO: set color
//            } else if (collectionView == self.collectionView){
//                print("recipe: did select")
//                let selectedRecipe = allRecipes[indexPath.item]
//                let detailPage = DetailPage()
//                detailPage.recipe = selectedRecipe
//                navigationController?.pushViewController(detailPage, animated: true)
//            }
//        }
//        
//    func filterCellDidSelect(at index: Int) {
//        print("select2")
//        selectedFilterIndex = index
//        let selectedFilter = filters[index]
//        
//        if selectedFilter == "ALL" {
//            filteredRecipes = allRecipes
//        } else {
//            filteredRecipes = allRecipes.filter { $0.difficulty == selectedFilter }
//            let new : [Recipe] = [filteredRecipes.first!]
//            filteredRecipes = new
////            var filteredRecipes1 : [Recipe] = allRecipes.filter { $0.difficulty == selectedFilter }
////            filteredRecipes[1] = filteredRecipes1.first!
//            
//            // Filter the recipes based on the selected difficulty
//            //filteredRecipes = allRecipes.filter { $0.difficulty == selectedFilter }
//            
//            print("2222Filtered Recipes: \(filteredRecipes.map { $0.difficulty })")
//
//        }
//
//        // Reload the filter collection view data
//        self.filter.reloadData()
//        self.collectionView.reloadData()
//    }
//    
//        func filterRecipes(with filter: String) {
//            if filter == "ALL"{
//                filteredRecipes = allRecipes
//                
//            } else {
//                filteredRecipes = allRecipes.filter {$0.difficulty == filter}
//            }
//            print("Filtered Recipes: \(filteredRecipes)")
//                
//                // Reload the filter collection view data
//            self.filter.reloadData()
//            collectionView.reloadData()
//            print("1111Filtered Recipes: \(filteredRecipes.map { $0.difficulty })")
//
//        }
//    }
//    
//
