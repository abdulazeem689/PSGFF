//
//  VideoCVCell.swift
//  PSGFF
//
//  Created by Abdul Azeem on 23/01/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class VideoCVCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //Outlets.
    @IBOutlet var collectionView: UICollectionView!
    //variables.
    var videoArr: [TrendingData]?
    var trendingVC: UIViewController?
    
    let oneVideoCellId = "oneVideoCellId"
    
    
    //MARK:- CollectionView DataSource and Delegate Methods.
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.videoArr!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: oneVideoCellId, for: indexPath) as! OneVideoCVCell
        cell.trendingVC = self.trendingVC
        cell.setCellContent(videoArr: self.videoArr!, indexpath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = self.trendingVC?.storyboard?.instantiateViewController(identifier: "playerVC") as? PlayerVC else{return}
        vc.urlString = self.videoArr![indexPath.row].videoUrl
        self.trendingVC?.present(vc, animated: true, completion: nil)
    }
}
