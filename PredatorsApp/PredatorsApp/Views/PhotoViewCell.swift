//
//  PhotoViewCell.swift
//  PredatorsApp
//
//  Created by Matvei Khlestov on 16.04.2024.
//

import UIKit

final class PhotoViewCell: UITableViewCell {
    
    lazy var cellView: UIView = {
        let cellView = UIView(frame: bounds)
        cellView.backgroundColor = .appGray
        
        return cellView
    }()
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView(
            frame: CGRect(
                x: 30,
                y: 30,
                width: cellView.bounds.width - 60,
                height: cellView.bounds.width - 230
            )
        )
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(image: UIImage) {
        addSubview(cellView)
        cellView.addSubview(photoImageView)
        
        photoImageView.image = image
    }
}
