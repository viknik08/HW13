//
//  SettingsViewController.swift
//  HW13
//
//  Created by Виктор Басиев on 25.08.2022.
//

import UIKit
import SnapKit

final class SettingsViewController: UIViewController {
    
    private var settings: [[Settings]]?
    
//MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        settings = Settings.settings
        setupHierarhy()
        registerCell()
        setupLayout()
    }
    
//MARK: - Setup
    
    private func setupHierarhy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
    }
    
    private func registerCell() {
        tableView.register(CustomViewCellSwitcher.self, forCellReuseIdentifier: "switcherCell")
        tableView.register(CustomViewCell.self, forCellReuseIdentifier: "emptyCell")
        tableView.register(CustomViewCellTitle.self, forCellReuseIdentifier: "titleCell")
    }
}

//MARK: - Extension DataSource Delegate

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cell = settings?[indexPath.section][indexPath.row] else { return 0 }
        switch cell.type {
            
        case .title:
            return 120
        default:
            return 50
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = settings?[indexPath.section][indexPath.row] else { return UITableViewCell() }
        switch cell.type {

        case .switcher:
            let cell = tableView.dequeueReusableCell(withIdentifier: "switcherCell", for: indexPath) as! CustomViewCellSwitcher
            cell.setting = settings?[indexPath.section][indexPath.row]
            cell.selectionStyle = .none
            return cell
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! CustomViewCellTitle
            cell.setting = settings?[indexPath.section][indexPath.row]
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath) as! CustomViewCell
            cell.setting = settings?[indexPath.section][indexPath.row]
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = settings?[indexPath.section][indexPath.row] else {return}
        
        switch cell.type  {
        case .switcher:
            return
        default:
            let viewController = DetailViewController()
            tableView.deselectRow(at: indexPath, animated: true)
            viewController.setting = settings?[indexPath.section][indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
