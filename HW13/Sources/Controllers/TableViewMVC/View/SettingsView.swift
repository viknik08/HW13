//
//  SettingsViewController.swift
//  HW13
//
//  Created by Виктор Басиев on 25.08.2022.
//

import UIKit
import SnapKit

final class SettingsView: UIViewController {
    
    private var settings = [[Settings]]()

    func configureView(with models: [[Settings]]) {
        self.settings = models
    }
        
//MARK: - Outlets
    
     lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        return tableView
    }()
    
//MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    private func commonInit() {
        view.backgroundColor = .white
        setupHierarhy()
        setupLayout()
        registerCell()
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


