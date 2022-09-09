//
//  DetailView.swift
//  HW13
//
//  Created by Виктор Басиев on 25.08.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var setting: Settings?
    
//MARK: - Outlets
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        setupHierarhy()
        fillSetttings()
        setupLayot()
    }
    
//MARK: - Setup
    
    private func setupHierarhy() {
        view.addSubview(label)
        view.addSubview(image)
    }
    
    private func setupLayot() {
        image.snp.makeConstraints { make in
            make.centerY.centerX.equalTo(view)
            make.width.height.equalTo(50)
        }
        label.snp.makeConstraints { make in
            make.right.equalTo(view).inset(20)
            make.left.equalTo(view).offset(20)
            make.top.equalTo(image.snp.bottom).offset(30)
        }
    }
    
    private func fillSetttings() {
        if setting?.isSystemName == true {
            image.image = UIImage(systemName: setting?.image ?? "")
        } else {
            image.image = UIImage(named: setting?.image ?? "")
        }
        label.text = "This is \(setting?.label ?? "")"
    }
}
