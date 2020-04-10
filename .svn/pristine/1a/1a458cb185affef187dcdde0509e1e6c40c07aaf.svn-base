//
//  ContributorsTVCell.swift
//  PSGFF
//
//  Created by Abdul Azeem on 05/02/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class ContributorsTVCell: UITableViewCell {
    
    //Outlets.
    @IBOutlet var contributorImageView: UIImageView!
    @IBOutlet var contributorName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //MARK:- Method to set cell content.
    
    func setCellContent(contributorsArr: [ContributorsData], indexpath: IndexPath) {
        self.contributorName.text = contributorsArr[indexpath.row].contributorName
        ImageService().getImage(urlString: contributorsArr[indexpath.row].contributorIcon!) { (image) in
            DispatchQueue.main.async {
                self.contributorImageView.image = image
            }
        }
    }
}
