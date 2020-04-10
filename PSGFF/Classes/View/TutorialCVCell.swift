//
//  CollectionViewCell.swift
//  PSGFF
//
//  Created by Abdul Azeem on 15/01/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class TutorialCVCell: UICollectionViewCell {
    
    //Outlets.
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var content: UITextView!
    
    
    //MARK:- Method to set the content of the cell.
    
    func setCellContent(indexPath: IndexPath, dataArr: [DataStruct]) {
        self.title.text = dataArr[indexPath.row].title
        self.content.text = dataArr[indexPath.row].content
        ImageService().getImage(urlString: dataArr[indexPath.row].image!) { (image) in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
}
