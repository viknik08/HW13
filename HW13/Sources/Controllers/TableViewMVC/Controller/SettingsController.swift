//
//  SettingsController.swift
//  HW13
//
//  Created by Виктор Басиев on 09.09.2022.
//

import UIKit

class SettingsController: UIViewController {
    
    private var settingsView = SettingsView()
    
    private var model = SettingsModel()

    private func setupHierarhy() {
        view.addSubview(settingsView.view)
        addChild(settingsView)
        settingsView.didMove(toParent: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settigs"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarhy()
        configure()
        setDelegat()
    }
}

extension SettingsController {
    
    func configure() {
        let models = model.setupSettings()
        settingsView.configureView(with: models)
    }
    
    func setDelegat() {
        settingsView.tableView.delegate = self
        settingsView.tableView.dataSource = self
    }
}

extension SettingsController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = model.setupSettings()[indexPath.section][indexPath.row]
        switch cell.type {
            
        case .title:
            return 120
        default:
            return 50
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.setupSettings().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.setupSettings()[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = model.setupSettings()[indexPath.section][indexPath.row]
        switch cell.type {

        case .switcher:
            let cell = tableView.dequeueReusableCell(withIdentifier: "switcherCell", for: indexPath) as! CustomViewCellSwitcher
            cell.setting = model.setupSettings()[indexPath.section][indexPath.row]
            cell.selectionStyle = .none
            return cell
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! CustomViewCellTitle
            cell.setting = model.setupSettings()[indexPath.section][indexPath.row]
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath) as! CustomViewCell
            cell.setting = model.setupSettings()[indexPath.section][indexPath.row]
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = model.setupSettings()[indexPath.section][indexPath.row]

        switch cell.type  {
        case .switcher:
            return
        default:
            let viewController = DetailController()
             viewController.model = model.setupSettings()[indexPath.section][indexPath.row]
             navigationController?.pushViewController(viewController, animated: true)
        }
    }
}




