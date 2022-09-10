//
//  DetailView.swift
//  HW13
//
//  Created by Виктор Басиев on 25.08.2022.
//

import UIKit

final class DetailView: UIViewController {

    var setting: Settings? {
        didSet {
            if setting?.isSystemName == true {
                image.image = UIImage(systemName: setting?.image ?? "")
            } else {
                image.image = UIImage(named: setting?.image ?? "")
            }
            
            label.text = setting?.label
        }
    }

//MARK: - Outlets
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
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
    }
    
//MARK: - Setup
    
    private func setupHierarhy() {
        view.addSubview(label)
        view.addSubview(image)
    }
    
    private func setupLayout() {
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
}
