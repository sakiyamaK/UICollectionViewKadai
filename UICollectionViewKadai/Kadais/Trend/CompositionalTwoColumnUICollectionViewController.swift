//
//  CompositionalSizeUICollectionViewController.swift
//  CollectionViewKadai
//
//  Created by sakiyamaK on 2024/09/08.
//

import UIKit

final class CompositionalTwoColumnUICollectionViewController: UIViewController {
    private lazy var layout: UICollectionViewLayout = {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .absolute(100)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(100)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item, item]
        )
        
        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.className)
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        collectionView.applyArroundConstraint(equalTo: self.view)
        collectionView.reloadData()
    }
}

extension CompositionalTwoColumnUICollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        300
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.className, for: indexPath)
        let backgroundColor: UIColor
        switch indexPath.item%3 {
        case 0:
            backgroundColor = .systemRed
        case 1:
            backgroundColor = .systemBlue
        case 2:
            backgroundColor = .systemGreen
        default:
            backgroundColor = .white
        }
        cell.contentView.backgroundColor = backgroundColor
        return cell
    }
}

#Preview {
    CompositionalTwoColumnUICollectionViewController()
}
