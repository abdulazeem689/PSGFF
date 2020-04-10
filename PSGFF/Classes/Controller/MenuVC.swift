//
//  MenuVC.swift
//  PSGFF
//
//  Created by Abdul Azeem on 27/01/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    
    //Outlets.
    @IBOutlet var tableView: UITableView!
    
    var selectedMenuIndex = 1;
    //Constants.
    let menuCellId = "menuCellId"
    
    
    //MARK:- View Did Load.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showViewController()
    }
        
    func showViewController() {
        if (self.selectedMenuIndex > kMenuArr.count) {
            return
        }
        
        let identifier = kMenuArr[self.selectedMenuIndex].title
        self.performSegue(withIdentifier: identifier, sender: nil)
    }
}

//MARK:- TableView DataSource and Delegate Methods.

extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        kMenuArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: menuCellId, for: indexPath) as! MenuTVCell
        cell.itemTitle.text = kMenuArr[indexPath.row].title
        cell.itemImageView.image = UIImage(named: kMenuArr[indexPath.row].icon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row != selectedMenuIndex) { // hide menu view
            self.selectedMenuIndex = indexPath.row
            self.showViewController()
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                self.children.last?.view.frame.origin.x = 0
            }, completion: nil)
        }
    }
}

