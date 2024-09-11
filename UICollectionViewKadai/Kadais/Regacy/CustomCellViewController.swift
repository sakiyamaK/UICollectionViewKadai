//
//  CustomCellViewController.swift
//  CollectionViewKadai
//
//  Created by sakiyamaK on 2024/09/11.
//

import UIKit

final class CustomCellViewController: UIViewController {

    private let contentInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    private let minimumInteritemSpacing: CGFloat = 10
    
    private var users: [User] = []

    private lazy var layout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = minimumInteritemSpacing
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.className)
        collectionView.contentInset = contentInsets
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    func set(users: [User]) {
        self.users = users
    }
    
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
    
    private func cellWidth(numberOfRow: Int) -> CGFloat {
        let _numberOfRow: CGFloat = CGFloat(numberOfRow)
        let numberOfSpace = _numberOfRow - 1
        let visibleWidth = self.collectionView.frame.width - contentInsets.left - contentInsets.right - numberOfSpace * minimumInteritemSpacing
        let cellWidth = visibleWidth/_numberOfRow
        return cellWidth
    }
}

extension CustomCellViewController: UICollectionViewDelegateFlowLayout {
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

extension CustomCellViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard users.count == 30 else {
            return users.count
        }
                
        switch section%3 {
        case 0: return users[0...9].count
        case 1: return users[10...19].count
        default: return users[20...29].count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.className, for: indexPath) as! CustomCell
        
        let user = users[indexPath.section * 10 + indexPath.item]
        print(user)
        cell.configure(user: user)
        return cell
    }
}

// 非同期処理があると#Previewが使えないためダミーデータを読み込む
#Preview {
    {
        let vc = CustomCellViewController()
        vc.set(users: API.shared.getDummyUsers())
        return vc
    }()
}
