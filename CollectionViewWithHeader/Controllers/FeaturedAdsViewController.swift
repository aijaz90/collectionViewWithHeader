//
//  FeaturedAdsViewController.swift
//  CollectionViewWithHeader
//
//  Created by Aijaz Ali on 18/08/2020.
//  Copyright © 2020 IT Majlis2019. All rights reserved.
//

import UIKit

class FeaturedAdsViewController: UIViewController {
    @IBOutlet weak var featuredCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       let generalNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.featuredCollectionView.register(generalNib, forCellWithReuseIdentifier: "cell")
    }
}
extension FeaturedAdsViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 30 // Replace with count of your data for collectionViewA
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = featuredCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.titleName.text = "Dawat e Islami"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item Pressed index \(indexPath.row)")
    }
}
extension FeaturedAdsViewController:UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //  let collectionWidth = collectionView.bounds.width
//          let widht = (self.view.frame.size.width / 2) - 10
//          let height = (self.view.frame.size.height / 2) - 10
//
//
//          return CGSize(width: widht , height: height)
//      }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 1.3) - 20), height: CGFloat(100))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // for horizontal space
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // for verticale space
    }
}
