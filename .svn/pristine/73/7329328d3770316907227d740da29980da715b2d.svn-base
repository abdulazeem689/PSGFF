//
//  MessageTVCell.swift
//  PSGFF
//
//  Created by Abdul Azeem on 05/02/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class MessageTVCell: UITableViewCell {
    
    //Outlets.
    @IBOutlet var title: UILabel!
    @IBOutlet var messageDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //MARK:- Method to set cell content.
    
    func setCellContent(messagesArr: [MessageData], indexPath: IndexPath){
        self.title.text = messagesArr[indexPath.row].title
        self.messageDescription.text = messagesArr[indexPath.row].description
    }
}
