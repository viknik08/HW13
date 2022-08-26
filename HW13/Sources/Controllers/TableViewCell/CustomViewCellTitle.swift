//
//  CustomViewCellTitle.swift
//  HW13
//
//  Created by Виктор Басиев on 26.08.2022.
//

import UIKit
import SnapKit

final class CustomViewCellTitle: UITableViewCell {
    
    var setting: Settings? {
        didSet {
            image.image = setting?.image
            label.text = setting?.label
            labelBottom.text = setting?.labelDiscription
        }
    }

//MARK: - Outlets
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private let labelBottom: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    private var stackView = UIStackView()
    
//MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarhy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Setup
    
    private func setupHierarhy() {
        stackView = UIStackView(arrangedSubviews: [label, labelBottom], axis: .vertical, spasing: 10, distribution: .fill, aligment: nil)
        addSubview(image)
        addSubview(stackView)
    }
    
    private func setupLayout() {
        image.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(20)
            make.center.equalTo(contentView)
        }
        image.snp.makeConstraints { make in
            make.height.width.equalTo(100)
        }
        stackView.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(20)
            make.centerY.equalTo(contentView)
        }
    }
    
// MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.setting = nil
    }
}

