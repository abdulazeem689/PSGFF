//
//  OneVideoCVCell.swift
//  PSGFF
//
//  Created by Abdul Azeem on 23/01/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class OneVideoCVCell: UICollectionViewCell {
    
    //Outlets.
    @IBOutlet var videoThumb: UIImageView!
    @IBOutlet var videoTitle: UILabel!
    //Variables.
    var videoUrl: String?
    var trendingVC: UIViewController?
    
    //MARK:- Set Cell Content.
    
    func setCellContent(videoArr: [TrendingData], indexpath: IndexPath){
        self.videoUrl = videoArr[indexpath.row].videoUrl
        self.videoTitle.text = videoArr[indexpath.row].videoTitle
        ImageService().getImage(urlString: videoArr[indexpath.row].videoThumb!) { (image) in
            DispatchQueue.main.async {
                self.videoThumb.image = image
            }
        }
    }
    
    //MARK:- click video option icon.
    
    @IBAction func videoOptionsClicked(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let shareAction = UIAlertAction(title: "Share", style: .default) { (_) in
            let activityVC = UIActivityViewController(activityItems: [self.videoUrl!], applicationActivities: nil)
           // activityVC.modalPresentationStyle = .popover
          //  activityVC.popoverPresentationController?.sourceView = self.trendingVC?.view
            self.trendingVC?.present(activityVC, animated: true, completion: nil)
            print(self.videoUrl as Any)
        }
        let reportAction = UIAlertAction(title: "Report", style: .default) { (_) in
            print("reported")
        }
        actionSheet.addAction(shareAction)
        actionSheet.addAction(reportAction)
        self.trendingVC?.present(actionSheet, animated: true, completion: nil)
    }
}
