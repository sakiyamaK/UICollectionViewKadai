//
//  SomeSectionUICollectionViewController.swift
//  CollectionViewKadai
//
//  Created by sakiyamaK on 2024/09/10.
//

import UIKit

final class SomeUICollectionViewController: UIViewController {
    private let contentInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    private let minimumInteritemSpacing: CGFloat = 10

    private lazy var layout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = minimumInteritemSpacing
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.className)
        collectionView.contentInset = contentInsets
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        collectionView.applyArroundConstraint(equalTo: self.view)
        collectionView.reloadData()
    }
    
    private func cellWidth(numberOfRow: Int) -> CGFloat {
        let _numberOfRow: CGFloat = CGFloat(numberOfRow)
        let numberOfSpace = _numberOfRow - 1
        let visibleWidth = self.collectionView.frame.width - contentInsets.left - contentInsets.right - numberOfSpace * minimumInteritemSpacing
        let cellWidth = visibleWidth/_numberOfRow
        return cellWidth
    }
}

extension SomeUICollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat
        switch indexPath.section {
        case 0:
            width = cellWidth(numberOfRow: 1)
        case 1:
            width = cellWidth(numberOfRow: 2)
        default:
            width = cellWidth(numberOfRow: 3)
        }
        return CGSize(width: width, height: 100)
    }
}

extension SomeUICollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section%3 {
        case 0: return 10
        case 1: return 20
        default: return 30
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.className, for: indexPath)
        switch indexPath.item%3 {
        case 0:
            cell.contentView.backgroundColor = .systemRed
        case 1:
            cell.contentView.backgroundColor = .systemBlue
        default:
            cell.contentView.backgroundColor = .systemGreen
        }
        return cell
    }
}

#Preview {
    SomeUICollectionViewController()
}
