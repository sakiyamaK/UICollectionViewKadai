//
//  CustomCellCollectionViewCell.swift
//  CollectionViewKadai
//
//  Created by sakiyamaK on 2024/09/11.
//

import UIKit
import Kingfisher

class CustomCell: UICollectionViewCell {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var imageView: UIImageView = {
        var imageView: UIImageView = .init()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.systemGray
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(imageView)
        imageView.applyArroundConstraint(equalTo: self.contentView)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(user: User) {
        guard let thumbnail = user.picture.thumbnail else { return }
        let url = URL(string: thumbnail)
        imageView.kf.setImage(with: url)
    }
}
