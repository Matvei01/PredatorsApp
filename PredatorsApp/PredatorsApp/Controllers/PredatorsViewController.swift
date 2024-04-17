//
//  PredatorsViewController.swift
//  PredatorsApp
//
//  Created by Matvei Khlestov on 16.04.2024.
//

import UIKit

// MARK: - PredatorsViewController
final class PredatorsViewController: UIViewController {
    
    // MARK: - Private Properties
    private let cellID = "predatorCell"
    private let predators = Predator.getPredators()
    
    // MARK: - UI Elements
    private lazy var predatorsTableView: UITableView = {
        let tableView = UITableView(frame: view.frame)
        tableView.register(PredatorViewCell.self, forCellReuseIdentifier: cellID)
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
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(predatorsTableView)
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Predators"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - UITableViewDataSource
extension PredatorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        predators.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? PredatorViewCell else {
            return UITableViewCell()
        }
        
        let predator = predators[indexPath.row]
        
        cell.setupCell(predator: predator)
        cell.selectionStyle = .none
        cell.completion = { [ weak self ] in
            let predatorDetailsVC = PredatorDetailsViewController()
            predatorDetailsVC.predator = predator
            
            guard let self = self else { return }
            
            self.navigationController?.pushViewController(predatorDetailsVC, animated: true)
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PredatorsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.width
    }
}

