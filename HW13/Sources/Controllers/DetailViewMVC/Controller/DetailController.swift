//
//  DetailController.swift
//  HW13
//
//  Created by Виктор Басиев on 09.09.2022.
//

import UIKit

class DetailController: UIViewController {
    
    private var detailView = DetailView()
    
    var model: Settings?

    private func setupHierarhy() {
        view.addSubview(detailView.view)
        addChild(detailView)
        detailView.didMove(toParent: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarhy()
        configure()
    }
}

extension DetailController {
    func configure() {
        detailView.setting = model
    }
}

