//
//  MessagesVC.swift
//  PSGFF
//
//  Created by Abdul Azeem on 05/02/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class MessagesVC: BaseVC {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var messageView: UIView!
    @IBOutlet var messageTitle: UILabel!
    @IBOutlet var messageDesription: UITextView!
    var messagesArr = [MessageData]()
    
    let messageCellId = "messageCellId"
    
    
    //MARK:- View Did Load.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.messageView.isHidden = true
        DataManager.getMessages { (messagesArr) in
            DispatchQueue.main.async {
                self.messagesArr = messagesArr
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func dismissMessageView(_ sender: Any) {
        self.messageView.isHidden = true
    }
}


//MARK:- TableView Delegate and DataSource.

extension MessagesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.messagesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: messageCellId, for: indexPath) as! MessageTVCell
        cell.setCellContent(messagesArr: self.messagesArr, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.messageTitle.text = self.messagesArr[indexPath.row].title
        self.messageDesription.text = self.messagesArr[indexPath.row].description
        self.messageView.isHidden = false
    }
}
