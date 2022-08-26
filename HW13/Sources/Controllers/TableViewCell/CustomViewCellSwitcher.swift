//
//  CustomViewCellSwitcher.swift
//  HW13
//
//  Created by Виктор Басиев on 25.08.2022.
//

import UIKit
import SnapKit

class CustomViewCellSwitcher: UITableViewCell {
    
    var setting: Settings? {
        didSet {
            image.image = setting?.image
            label.text = setting?.label
        }
    }

//MARK: - Outlets
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let switcher: UISwitch = {
        let switcher = UISwitch()
        return switcher
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
        stackView = UIStackView(arrangedSubviews: [image, label], axis: .horizontal, spasing: 10, distribution: .fill, aligment: nil)
        addSubview(stackView)
        contentView.addSubview(switcher)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(20)
            make.center.equalTo(contentView)
        }
        image.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        switcher.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(self).offset(-20)
        }
    }
    
// MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.setting = nil
    }
}
