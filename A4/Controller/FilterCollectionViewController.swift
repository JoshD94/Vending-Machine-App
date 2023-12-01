//
//  FilterCollectionViewController.swift
//  A4
//
//  Created by 张天逸 on 2023/11/11.
//



//import Foundation
//import UIKit
//
//class FilterCollectionViewController: UICollectionViewCell {
//    
//    var filters: [String] = ["All", "Beginner", "Intermediate", "Advanced"]
//    var selectedFilterIndex: Int = 0 // Default to "All"
//    
//    @IBOutlet weak var button: UIButton!
//    static let reuse = "reuse"
//    
//    
//    
//}
//class FilterCollectionViewController: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//
//    var filters: [String] = ["All", "Beginner", "Intermediate", "Advanced"]
//    var selectedFilterIndex: Int = 0 // Default to "All"
//
////    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Set up your collection view layout, register FilterCollectionViewCell, etc.
//    }

//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return filters.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as! FilterCollectionViewCell
//        let filter = filters[indexPath.item]
//        cell.filterButton.setTitle(filter, for: .normal)
//        cell.filterButton.isSelected = indexPath.item == selectedFilterIndex
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        selectedFilterIndex = indexPath.item
//        collectionView.reloadData() // Update cell selection
//        // Implement filtering logic here
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 116, height: 32)
//    }



////
////  FilterCollectionViewController.swift
////  A4
////
////  Created by 张天逸 on 2023/11/11.
////
//
//import Foundation
//import UIKit
//
//class FilterCollectionViewController: UICollectionViewController {
//
//    var filters: [String] = ["All", "Beginner", "Intermediate", "Advanced"]
//    var selectedFilterIndex: Int = 0 // Default to "All"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Set up your collection view layout, register FilterCollectionViewCell, etc.
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return filters.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as! FilterCollectionViewCell
//        let filter = filters[indexPath.item]
//        cell.filterButton.setTitle(filter, for: .normal)
//        cell.filterButton.isSelected = indexPath.item == selectedFilterIndex
//        return cell
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        selectedFilterIndex = indexPath.item
//        collectionView.reloadData() // Update cell selection
//        // Implement filtering logic here
//    }
//}
