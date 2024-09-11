//
//  CompositionalCustomCellUICollectionViewController.swift
//  CollectionViewKadai
//
//  Created by sakiyamaK on 2024/09/12.
//

import UIKit

final class CompositionalCustomCellUICollectionViewController: UIViewController {
    
    private let numberOfSections: Int = 3
    
    private var users: [User] = []
    
    private lazy var layout: UICollectionViewLayout = {

        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex%self.numberOfSections {
            case 0:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(150)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(150)
                )
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                return section
            case 1:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(100),
                    heightDimension: .fractionalHeight(0.5)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .absolute(100),
                    heightDimension: .absolute(200)
                )
                
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    subitems: [item, item]
                )
                                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
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
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.className)
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        collectionView.applyArroundConstraint(equalTo: self.view)
        
        if users.isEmpty {
            Task {
                do {
                    users = try await API.shared.getUsers()
                    collectionView.reloadData()
                } catch let e {
                    print(e)
                }
            }
        }
    }
    
    func set(users: [User]) {
        self.users = users
    }
}

extension CompositionalCustomCellUICollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section % numberOfSections {
        case 0:
            return users.count
        case 1:
            return users.count
        case 2:
            return users.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.className, for: indexPath) as! CustomCell
        
        let user = users[indexPath.row]
        cell.configure(user: user)
        return cell
    }
}

// 非同期処理があると#Previewが使えないためダミーデータを読み込む
#Preview {
    {
        let vc = CompositionalCustomCellUICollectionViewController()
        vc.set(users: API.shared.getDummyUsers())
        return vc
    }()
}
