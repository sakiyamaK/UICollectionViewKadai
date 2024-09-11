//
//  TwoColumnUICollectionViewController.swift
//  CollectionViewKadai
//
//  Created by sakiyamaK on 2024/09/10.
//

import UIKit

final class TwoColumnUICollectionViewController: UIViewController {
    private let contentInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    private let numberOfRow: CGFloat = 2
    private let minimumInteritemSpacing: CGFloat = 10

    private lazy var layout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        // セル同士の間隔の数
        let numberOfSpace = (numberOfRow - 1)
        let visibleWidth = self.view.frame.width - contentInsets.left - contentInsets.right - numberOfSpace * minimumInteritemSpacing
        let cellWidth = visibleWidth/numberOfRow
        layout.itemSize = .init(width: cellWidth, height: 100)
        layout.minimumLineSpacing = minimumInteritemSpacing
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.className)
        collectionView.dataSource = self
        collectionView.contentInset = contentInsets
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        collectionView.applyArroundConstraint(equalTo: self.view)
        collectionView.reloadData()
    }
}

extension TwoColumnUICollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        300
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.className, for: indexPath)
        cell.contentView.backgroundColor = .systemRed
        return cell
    }
}

#Preview {
    TwoColumnUICollectionViewController()
}
