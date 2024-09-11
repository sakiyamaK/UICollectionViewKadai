//
//  DefaultUICollectionViewController.swift
//  CollectionViewKadai
//
//  Created by sakiyamaK on 2024/09/08.
//

import UIKit

final class CompositionalListUICollectionViewController: UIViewController {
    private let layout: UICollectionViewLayout = {
        let configuration: UICollectionLayoutListConfiguration = .init(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
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

extension CompositionalListUICollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        300
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.className, for: indexPath)
        cell.contentView.backgroundColor = indexPath.item%2 == 0 ? .systemRed : .systemBlue
        return cell
    }
}

#Preview {
    CompositionalListUICollectionViewController()
}
