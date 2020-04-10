//
//  ViewController.swift
//  PSGFF
//
//  Created by Abdul Azeem on 14/01/20.
//  Copyright © 2020 Mindfire. All rights reserved.
//

import UIKit

class TutorialVC: UIViewController {
    
    //Outlets.
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var getStartedView: UIView!
    @IBOutlet var connectivityAlert: UITextField!
    //Variables.
    var dataArr = [DataStruct]()
    //Constants.
    let cellId = "contentCellId"
    
    //MARK:- ViewDidLoad.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showContentIfInternetConnected()
        DataManager.getTutorialsData { (dataArr) in
            DispatchQueue.main.async {
                self.dataArr = dataArr
                self.pageControl.numberOfPages = self.dataArr.count
                self.collectionView.reloadData()
            }
        }
    }
    
    
    //MARK:- Check if internet is available.
    
    private func showContentIfInternetConnected() {
        self.connectivityAlert.isHidden = true
        self.collectionView.isHidden = true
        self.pageControl.isHidden = true
        self.getStartedView.isHidden = true
        if InternetManager.connectedToNetwork() {
            Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.ifContentShown), userInfo: nil, repeats: false)
        }
        else {
            self.connectivityAlert.isHidden = false
            Timer.scheduledTimer(timeInterval: kTimeInterval, target: self, selector: #selector(self.hideConnectivityAlert), userInfo: nil, repeats: false)
        }
    }
    
    @objc func ifContentShown() {
        if self.collectionView.isHidden {
            self.connectivityAlert.isHidden = false
        }
    }
    
    @objc func hideConnectivityAlert() {
        self.connectivityAlert.isHidden = true
    }
}


//MARK:- Collectionview DataSource and Delegate Methods.

extension TutorialVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TutorialCVCell
        cell.setCellContent(indexPath: indexPath, dataArr: self.dataArr)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.collectionView.isHidden = false
        self.pageControl.isHidden = false
        self.getStartedView.isHidden = false
        self.connectivityAlert.isHidden = true
        self.pageControl.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
}

