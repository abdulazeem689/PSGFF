//
//  TrendingVC.swift
//  PSGFF
//
//  Created by Abdul Azeem on 23/01/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class TrendingVC: BaseVC {
    
    //Outlet.
    @IBOutlet var collectionView: UICollectionView!
    
    var trendingArr = [Any]()
    
    let tweetCellId = "tweetCellId"
    let videoCellId = "videoCellId"
    let tweetVCId = "tweetVC"
    
    
    //MARK:- View Did Load.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        DataManager.getTrendingData { (parsedTrendingArr) in
            DispatchQueue.main.async {
                self.trendingArr = HelpingMethods().modifyingParsedData(parsedTrendingArr: parsedTrendingArr)
                self.collectionView.reloadData()
            }
        }
    }
}

//MARK:- Collectionview DataSource and Delegate Methods.

extension TrendingVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.trendingArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row % 2 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tweetCellId, for: indexPath) as! TweetCVCell
            let trendingData = self.trendingArr[indexPath.row] as! TrendingData
            cell.setCellContent(trendingData: trendingData)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: videoCellId, for: indexPath) as! VideoCVCell
            cell.videoArr = self.trendingArr[indexPath.row] as? [TrendingData]
            cell.trendingVC = self
            cell.collectionView.reloadData()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: tweetVCId) as! TweetHandlerVC
            let trendingData = self.trendingArr[indexPath.row] as! TrendingData
            vc.urlString = trendingData.onlyLink
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
