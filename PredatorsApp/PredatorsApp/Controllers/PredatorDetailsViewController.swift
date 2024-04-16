//
//  PredatorDetailsViewController.swift
//  PredatorsApp
//
//  Created by Matvei Khlestov on 16.04.2024.
//

import UIKit

final class PredatorDetailsViewController: UIViewController {
    
    // MARK: - Public Properties
    var predator: Predator!
    
    // MARK: - Private Properties
    private let cellID = "photoCell"
    
    // MARK: - UI Elements
    private lazy var nameLabel: UILabel = {
        let label = UILabel(
            frame: CGRect(
                x: 0,
                y: 74,
                width: 250,
                height: 44
            )
        )
        
        label.center.x = view.center.x
        label.text = predator.name
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView(
            frame: CGRect(
                x: 30,
                y: nameLabel.frame.maxY + 25,
                width: view.frame.width - 60,
                height: 189
            )
        )
        imageView.image = UIImage(named: predator.photo.largePhoto)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(
            frame: CGRect(
                x: mainImageView.frame.origin.x,
                y: mainImageView.frame.maxY + 25,
                width: mainImageView.frame.width,
                height: 51
            )
        )
        label.text = predator.description
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var photosTableView: UITableView = {
        let tableView = UITableView(
            frame: CGRect(
                x: 0,
                y: descriptionLabel.frame.maxY + 25,
                width: view.frame.width,
                height: view.frame.height / 2
            )
        )
        tableView.register(PhotoViewCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Private Methods
private extension PredatorDetailsViewController {
    func setupView() {
        view.backgroundColor = .white
        addSubviews()
    }
    
    func addSubviews() {
        setupSubviews(
            nameLabel,
            mainImageView,
            descriptionLabel,
            photosTableView
        )
    }
    
    func setupSubviews(_ subviews: UIView... ) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
}

// MARK: - UITableViewDataSource
extension PredatorDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: tableView.frame.size.width,
                height: 50
            )
        )
        
        let label = UILabel(
            frame: CGRect(
                x: 30,
                y: -5,
                width: tableView.frame.size.width - 60,
                height: 30
            )
        )
        
        label.text = "Фотографии"
        label.font = .boldSystemFont(ofSize: 20)
        headerView.addSubview(label)
        
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        predator.photo.smallPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? PhotoViewCell else {
            return UITableViewCell()
        }
        
        let photo = predator.photo.smallPhotos[indexPath.row]
        
        cell.setupCell(image: UIImage(named: photo) ?? UIImage())
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PredatorDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.width - 198
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPhoto = predator.photo.smallPhotos[indexPath.row]
        
        if let selectedImage = UIImage(named: selectedPhoto) {
            let imageVC = ImageViewController()
            imageVC.selectedImage = selectedImage
            
            navigationController?.pushViewController(imageVC, animated: true)
        }
    }
}

