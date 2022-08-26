//
//  CustomViewCellWithLabel.swift
//  HW13
//
//  Created by Виктор Басиев on 26.08.2022.
//


import UIKit
import SnapKit

final class CustomViewCellWithLabel: UITableViewCell {
    
    var setting: Settings? {
        didSet {
            imageLeft.image = setting?.image
            labelLeft.text = setting?.label
            labelRight.text = setting?.labelDiscription
        }
    }

//MARK: - Outlets
    
    private let imageLeft: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let labelLeft: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let labelRight: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
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
        stackView = UIStackView(arrangedSubviews: [imageLeft, labelLeft], axis: .horizontal, spasing: 10, distribution: .fill, aligment: nil)
        addSubview(stackView)
        contentView.addSubview(labelRight)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(20)
            make.center.equalTo(contentView)
        }
        imageLeft.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        labelRight.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(15)
            make.right.equalTo(self).offset(-40)
        }
    }
    
// MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.setting = nil
    }
}

