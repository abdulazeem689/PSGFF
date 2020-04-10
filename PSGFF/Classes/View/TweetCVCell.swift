//
//  TweetCVCell.swift
//  PSGFF
//
//  Created by Abdul Azeem on 23/01/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class TweetCVCell: UICollectionViewCell {
    
    //Outlets.
    @IBOutlet var tweetImage: UIImageView!
    @IBOutlet var tweetText: UILabel!
    
    
    //MARK:- Method to set the content of the cell.
    
    func setCellContent(trendingData: TrendingData){
        self.tweetText.text = trendingData.tweetText
        ImageService().getImage(urlString: trendingData.tweetImage!) { (image) in
            DispatchQueue.main.async {
                self.tweetImage.image = image
            }
        }
    }
}
