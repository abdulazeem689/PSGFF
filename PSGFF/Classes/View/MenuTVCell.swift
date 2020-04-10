//
//  MenuTVCell.swift
//  PSGFF
//
//  Created by Abdul Azeem on 28/01/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class MenuTVCell: UITableViewCell {
    
    //Outlets.
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var itemTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
