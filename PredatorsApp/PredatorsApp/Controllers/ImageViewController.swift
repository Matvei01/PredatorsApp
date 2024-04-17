//
//  ImageViewController.swift
//  PredatorsApp
//
//  Created by Matvei Khlestov on 16.04.2024.
//

import UIKit

final class ImageViewController: UIViewController {
    
    var selectedImage: UIImage?
    
    private lazy var mainImageView: UIImageView = {
        let imageView = UIImageView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: view.frame.width,
                height: 285
            )
        )
        imageView.image = selectedImage
        imageView.contentMode = .scaleAspectFill
        imageView.center.x = view.center.x
        imageView.center.y = view.center.y
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(mainImageView)
    }
}
