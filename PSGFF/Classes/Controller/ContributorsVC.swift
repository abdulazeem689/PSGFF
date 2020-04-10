//
//  ContributersVC.swift
//  PSGFF
//
//  Created by Abdul Azeem on 04/02/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class ContributorsVC: BaseVC {
    
    @IBOutlet var tableView: UITableView!
    var contributorsArr = [ContributorsData]()
    var filteredData = [ContributorsData]()
    
    let contributorCellId = "contributorCellId"
    
    let searchController = UISearchController(searchResultsController: nil)
    var isSearcgBarEmpty: Bool{
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool{
        return searchController.isActive && !isSearcgBarEmpty
    }
    var titleview: UIView?
    var isSearching: Bool = false
    
    
    //MARK:- View Did Load.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.isSearching = false
        self.titleview = navigationItem.titleView
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search.."
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.searchTextField.textColor = .black
        searchController.automaticallyShowsCancelButton = false
        searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        
        DataManager.getContributorsList { (contributorsArr) in
            DispatchQueue.main.async {
                self.contributorsArr = contributorsArr
                self.tableView.reloadData()
            }
        }
    }
    
    func filterSearchContent(searchText: String) {
        filteredData = contributorsArr.filter({ (data: ContributorsData) -> Bool in
            return data.contributorName!.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        navigationItem.titleView = isSearching ? self.titleview : searchController.searchBar
        isSearching = !isSearching
    }
}

//MARK:- TableView Delegate and DataSource.

extension ContributorsVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? self.filteredData.count : self.contributorsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: contributorCellId, for: indexPath) as! ContributorsTVCell
        let contributorsArr = isFiltering ? self.filteredData : self.contributorsArr
        cell.setCellContent(contributorsArr: contributorsArr, indexpath: indexPath)
        return cell
    }
}

//MARK:- Search results Updater deleagte.

extension ContributorsVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        self.filterSearchContent(searchText: searchBar.text!)
    }
}
