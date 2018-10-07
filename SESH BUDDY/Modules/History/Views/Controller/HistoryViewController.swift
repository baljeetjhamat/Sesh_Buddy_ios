//
//  HistoryViewController.swift
//  SESH BUDDY
//
//  Created by test on 07/10/18.
//  Copyright © 2018 Baljeet Kaur. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, HistoryViewProtocol {
    
    @IBOutlet weak var historyCollectionViewFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var historyCollectionView: UICollectionView!
    var presenter: HistoryPresenterProtocol?
    let historyCollectionViewCell = "HistoryCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.changeStyle(.default)
        self.showMenuBarButton(true)
        self.setNavBarTitleView(image: ThemeImages.appLogo)
        registerNib()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavBarRightButton(type: .plus)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.setNavBarTitleView(image: ThemeImages.appLogo)
        self.changeNavBarColor(.themeNavBarColor)
    }
    func registerNib() {
        historyCollectionView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0)
        historyCollectionView.register(UINib(nibName: historyCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: historyCollectionViewCell)
        historyCollectionView.delegate = self
        historyCollectionView.dataSource = self
       // historyCollectionViewFlowLayout.itemSize = CGSize(width: (screenWidth)/3, height: (screenWidth)/3 + 10)
        
    }
}
extension HistoryViewController: UICollectionViewDelegate {
    
}
extension HistoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: historyCollectionViewCell, for: indexPath) as? HistoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}
extension HistoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 20.0
        let width = collectionView.frame.size.width
        return CGSize(width: (width - margin)/3, height: (screenWidth - margin)/3 + 15)
    }
}
