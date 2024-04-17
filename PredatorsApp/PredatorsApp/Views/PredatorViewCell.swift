//
//  PredatorViewCell.swift
//  PredatorsApp
//
//  Created by Matvei Khlestov on 16.04.2024.
//

import UIKit

// MARK: - PredatorViewCell
final class PredatorViewCell: UITableViewCell {
    
    // MARK: - Public Properties
    var smallPhotos: [UIImageView] = []
    
    var completion: ( () -> Void)?
    
    // MARK: - UI Elements
    lazy var cellView: UIView = {
        let cellView = UIView(frame: bounds)
        
        return cellView
    }()
    
    lazy var predatorView: UIView = {
        let predatorView = UIView(
            frame: CGRect(
                x: 30,
                y: 10,
                width: cellView.bounds.width - 60,
                height: cellView.bounds.width - 30
            )
        )
        predatorView.backgroundColor = .appGray
        predatorView.layer.cornerRadius = 30
        
        return predatorView
    }()
    
    lazy var largeImageView: UIImageView = {
        let imageView = UIImageView(
            frame: CGRect(
                x: 25,
                y: 15,
                width: predatorView.bounds.width - 50,
                height: 163
            )
        )
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        
        return imageView
    }()
    
    lazy var smallPhotosStackView: UIStackView = {
        let stackView = UIStackView(
            frame: CGRect(
                x: 25,
                y: largeImageView.frame.maxY + 12,
                width: predatorView.bounds.width - 50,
                height: 99
            )
        )
        stackView.axis = .horizontal
        stackView.spacing = 11
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(
            frame: CGRect(
                x: 20,
                y: 70,
                width: largeImageView.bounds.width - 40,
                height: 24
            )
        )
        
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(
            frame: CGRect(
                x: 20,
                y: nameLabel.frame.maxY + 4,
                width: largeImageView.bounds.width - 40,
                height: 51
            )
        )
        
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var showDetailsButton: UIButton = {
        let button = UIButton(
            frame: CGRect(
                x: 25,
                y: predatorView.bounds.height - 64,
                width: predatorView.bounds.width - 50,
                height: 49
            ),
            primaryAction: UIAction(handler: { [ weak self ] _ in
                guard let self = self else { return }
                
                self.completion?()
            })
        )
        button.backgroundColor = .appBlack
        button.layer.cornerRadius = 20
        button.setTitle("show details", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        
        return button
    }()
    
    // MARK: - Override Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func setupCell(predator: Predator) {
        
        addSubviews()
        
        largeImageView.image = UIImage(named: predator.photo.largePhoto)
        
        nameLabel.text = predator.name
        descriptionLabel.text = predator.description
        
        for photo in predator.photo.smallPhotos {
            if let smallImage = UIImage(named: photo) {
                let smallImageView = createImageView(image: smallImage)
                smallPhotosStackView.addArrangedSubview(smallImageView)
                smallPhotos.append(smallImageView)
            }
        }
    }
    
    func addSubviews() {
        addSubview(cellView)
        
        cellView.addSubview(predatorView)
        
        predatorView.addSubview(largeImageView)
        predatorView.addSubview(smallPhotosStackView)
        predatorView.addSubview(showDetailsButton)
        
        largeImageView.addSubview(nameLabel)
        largeImageView.addSubview(descriptionLabel)
    }
    
    func createImageView(image: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }
}
