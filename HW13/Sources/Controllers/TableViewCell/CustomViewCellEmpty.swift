//
//  CustomViewCellEmpty.swift
//  HW13
//
//  Created by Виктор Басиев on 25.08.2022.
//

import UIKit
import SnapKit

class CustomViewCellEmpty: UITableViewCell {
    
    var setting: Settings? {
        didSet {
            imageLeft.image = setting?.image
            label.text = setting?.label
        }
    }

//MARK: - Outlets
    
    private let imageLeft: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private let imageRight: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.image = UIImage(named: "messred")
        image.contentMode = .scaleAspectFill
        return image
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
        stackView = UIStackView(arrangedSubviews: [imageLeft, label], axis: .horizontal, spasing: 10, distribution: .fill, aligment: nil)
        addSubview(stackView)
        contentView.addSubview(imageRight)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(20)
            make.center.equalTo(contentView)
        }
        imageLeft.snp.makeConstraints { make in
            make.height.width.equalTo(20)
        }
        imageRight.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.right.equalTo(self).offset(-40)
            make.height.width.equalTo(30)
        }
    }
// MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.setting = nil
    }
}
