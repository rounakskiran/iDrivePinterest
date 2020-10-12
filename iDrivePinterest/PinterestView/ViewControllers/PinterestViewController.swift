//
//  ViewController.swift
//  iDrivePinterest
//
//  Created by Rounak S Kiran on 10/10/20.
//

import UIKit
import iDriveLibrary

class PinterestViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellPadding: CGFloat = 10
    let imagesPerRow: CGFloat = 3
    var dataSource: [PasteBinModel] = []
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = IDriveConstants.pinterestViewHeading
        configureCollectionView()
        fetchPageData()
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = cellPadding
            layout.minimumLineSpacing = cellPadding
            layout.sectionInset = UIEdgeInsets(top: cellPadding, left: cellPadding, bottom: cellPadding, right: cellPadding)
        }
        collectionView.addSubview(refreshControl)
        collectionView.register(UINib(nibName: "PinterestCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "PinterestCollectionViewCell")
        refreshControl.addTarget(self, action: #selector(fetchPageData), for: .valueChanged)
    }
    
    @objc func fetchPageData() {
        Repository().fetchData(url: IDriveConstants.serverUrl, decodingType: [PasteBinModel].self) { [weak self] (data) in
            guard let strongSelf = self else {
                return
            }
            DispatchQueue.main.async {
                strongSelf.refreshControl.endRefreshing()
                if let data = data {
                    strongSelf.dataSource = data
                    strongSelf.collectionView.reloadData()
                }
            }
        }
    }
    
}

extension PinterestViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PinterestCollectionViewCell", for: indexPath) as? PinterestCollectionViewCell {
            cell.imageView.backgroundColor = .red
            cell.imageView.setImage(url: dataSource[indexPath.row].user?.profileImage?.large ?? "")
            return cell
        }
        return UICollectionViewCell()
    }
}

extension PinterestViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getCellSize()
    }
    
    func getCellSize() -> CGSize {
        let paddingSpacePerRow: CGFloat = (imagesPerRow + 1) * cellPadding
        var cellWidth = (collectionView.frame.width - paddingSpacePerRow) / imagesPerRow
        cellWidth = cellWidth.rounded(.towardZero)
        let size = CGSize(width: cellWidth, height: cellWidth)
        return size
    }
}

