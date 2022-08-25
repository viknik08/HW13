//
//  SettingsViewController.swift
//  HW13
//
//  Created by Виктор Басиев on 25.08.2022.
//

import UIKit

class SettingsViewController: UIViewController {
//MARK: - Outlets
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomViewCell.self, forHeaderFooterViewReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
//MARK: - Setup

}
//MARK: - Extension DataSource Delegate
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomViewCell
        return cell ?? UITableViewCell()
    }
    
    
}
