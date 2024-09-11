//
//  CompositionalSomeSectionUICollectionViewController.swift
//  CollectionViewKadai
//
//  Created by sakiyamaK on 2024/09/12.
//

import UIKit

final class CompositionalSomeSectionUICollectionViewController: UIViewController {
    
    private let numberOfSections: Int = 3
    
    private lazy var layout: UICollectionViewLayout = {

        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex%self.numberOfSections {
            case 0:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(100)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(100)
                )
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                return section
            case 1:
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
                return section
            case 2:
                
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.333),
                    heightDimension: .absolute(100)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(100)
                )
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item, item, item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                return section
            default:
                fatalError()
            }
        }
        
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

extension CompositionalSomeSectionUICollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section % numberOfSections {
        case 0:
            return 10
        case 1:
            return 20
        case 2:
            return 30
        default:
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.className, for: indexPath)
        
        let backgroundColor: UIColor
        switch indexPath.item%4 {
        case 0:
            backgroundColor = .systemRed
        case 1:
            backgroundColor = .systemBlue
        case 2:
            backgroundColor = .systemGreen
        case 3:
            backgroundColor = .systemOrange
        default:
            backgroundColor = .white
        }
        cell.backgroundColor = backgroundColor
        
        return cell
    }
}

#Preview {
    CompositionalSomeSectionUICollectionViewController()
}
