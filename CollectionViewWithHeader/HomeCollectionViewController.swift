//
//  ViewController.swift
//  CollectionViewWithHeader
//
//  Created by Aijaz Ali on 17/08/2020.
//  Copyright © 2020 IT Majlis2019. All rights reserved.
//

import UIKit

class HomeCollectionViewController: UIViewController {

    @IBOutlet weak var homeMainCollectionView: UICollectionView!

    var headerView:HomeHeaderCollectionReusableView = HomeHeaderCollectionReusableView()
     var generalNib = UINib()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.registerCollectionView()
    }
    func registerCollectionView(){
              generalNib = UINib(nibName: "CollectionViewCell", bundle: nil)
              self.homeMainCollectionView.register(generalNib, forCellWithReuseIdentifier: "cell")
       // let nibLatestTableCell = UINib(nibName: "FeaturedAdsCollectionViewCell", bundle: nil)
       // homeMainCollectionView.register(nibLatestTableCell, forCellWithReuseIdentifier: "featuredCell")
    }

}
extension HomeCollectionViewController:UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //  let collectionWidth = collectionView.bounds.width
//          let widht = (self.view.frame.size.width / 2) - 10
//          let height = (self.view.frame.size.height / 2) - 10
//
//
//          return CGSize(width: widht , height: height)
//      }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 3) - 20), height: CGFloat(100)) // cell height and width
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // for horizontal space
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // for verticale space
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           if homeMainCollectionView.frame.height < 480{
               return  CGSize(width: homeMainCollectionView.frame.width, height: ((homeMainCollectionView.frame.height)/1.1)-10)
           }
        return  (UIDevice.current.userInterfaceIdiom == .pad) ? CGSize(width: homeMainCollectionView.frame.width, height: ((homeMainCollectionView.frame.height)/1.7)-15) :  CGSize(width: homeMainCollectionView.frame.width, height: ((homeMainCollectionView.frame.height)/1.8)) //for iphone 1.56
       }
}
extension HomeCollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // return 30
        if collectionView == self.homeMainCollectionView {
            return 30 // Replace with count of your data for collectionViewA
        }

        return 10 // Replace with count of your data for collectionViewB
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
       }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //if indexPath.row == 0{
         //   let cell=homeMainCollectionView.dequeueReusableCell(withReuseIdentifier:"featuredCell", for: indexPath) as! //FeaturedAdsCollectionViewCell
           // cell.delegate = self
         //   cell.horizontalCollectionView.reloadData()
           // cell.contentView.backgroundColor = UIColor.clear
          //  return cell
      //  }
        let cell = homeMainCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.titleName.text = "Dawat e Islami"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           print("Item Pressed index \(indexPath.row)")
       }
    // Adding Header here.
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard
                   let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCell", for: indexPath) as? HomeHeaderCollectionReusableView
                    else { fatalError("Invalid view type") }
                            headerView.homeImage.layer.cornerRadius = 20
                            headerView.firstView.layer.cornerRadius = 15
                            headerView.secondView.layer.cornerRadius = 15
                            headerView.thirdView.layer.cornerRadius = 15
                            headerView.fourthView.layer.cornerRadius = 15
                            headerView.fourthView.backgroundColor = UIColor.clear
                //Set Action on Views
                            headerView.firstView.isUserInteractionEnabled = true
                            headerView.secondView.isUserInteractionEnabled = true;
                            headerView.thirdView.isUserInteractionEnabled = true;
                            headerView.fourthView.isUserInteractionEnabled = true;
                            headerView.firstView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(filterFirstViewPressed)))
                            headerView.secondView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(filterSecondViewPressed)))
                            headerView.thirdView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(filterThirdViewPressed)))
                            headerView.fourthView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(filterFourthViewPressed)))
                
                let mediaViewController = UIStoryboard.init(name: "Main", bundle:Bundle(for: FeaturedAdsViewController.self)).instantiateViewController(withIdentifier: "FeaturedAdsViewController") as? FeaturedAdsViewController
                        mediaViewController?.view.frame = headerView.featuredAdsView.bounds;
                        addChild(mediaViewController!)
                        headerView.featuredAdsView.addSubview(mediaViewController!.view)
                        mediaViewController!.didMove(toParent: self)
                return headerView
            default:
                assert(false, "Invalid element type")
            }
        }
   
}
extension HomeCollectionViewController{
    @objc func filterFirstViewPressed(){
        print("First View Paressed")
    }
    @objc func filterSecondViewPressed(){
         print("Second View Paressed")
    }
    @objc func filterThirdViewPressed(){
         print("Third View Paressed")
    }
    @objc func filterFourthViewPressed(){
         print("Fourth View Paressed")
    }
}
