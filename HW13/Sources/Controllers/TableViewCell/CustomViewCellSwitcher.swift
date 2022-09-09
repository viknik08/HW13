//
//  CustomViewCellSwitcher.swift
//  HW13
//
//  Created by Виктор Басиев on 25.08.2022.
//

import UIKit
import SnapKit

final class CustomViewCellSwitcher: UITableViewCell {
    
    var setting: Settings? {
        didSet {
            if setting?.isSystemName == true {
                image.image = UIImage(systemName: setting?.image ?? "")
            } else {
                image.image = UIImage(named: setting?.image ?? "")
            }
            
            switch setting?.backgroundColor {
                
            case .systemBlue:
                viewForImage.backgroundColor = .systemBlue
            case .systemOrange:
                viewForImage.backgroundColor = .systemOrange
            default:
                viewForImage.backgroundColor = .none
            }
            
            label.text = setting?.label
        }
    }

//MARK: - Outlets
    
    private let viewForImage: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.backgroundColor = .systemCyan
        return view
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
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
        stackView = UIStackView(arrangedSubviews: [viewForImage, label], axis: .horizontal, spasing: 10, distribution: .fill, aligment: nil)
        addSubview(stackView)
        viewForImage.addSubview(image)
        contentView.addSubview(switcher)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(20)
            make.center.equalTo(contentView)
        }
        viewForImage.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(20)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        image.snp.makeConstraints { make in
            make.center.equalTo(viewForImage)
            make.height.width.equalTo(23)
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
