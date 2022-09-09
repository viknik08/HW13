//
//  CustomViewCell.swift
//  HW13
//
//  Created by Виктор Басиев on 25.08.2022.
//

import UIKit
import SnapKit

final class CustomViewCell: UITableViewCell {

    var setting: Settings? {
        didSet {
            switch setting?.type {
                
            case .label:
                labelRight.isHidden = false
                imageNotification.isHidden = true
            case .notification:
                labelRight.isHidden = true
                imageNotification.isHidden = false
            default:
                labelRight.isHidden = true
                imageNotification.isHidden = true
            }
            
            if setting?.isSystemName == true {
                image.image = UIImage(systemName: setting?.image ?? "")
            } else {
                image.image = UIImage(named: setting?.image ?? "")
            }
            
            switch setting?.backgroundColor {

            case .systemBlue:
                viewForImage.backgroundColor = .systemBlue
            case .systemGreen:
                viewForImage.backgroundColor = .systemGreen
            case .systemRed:
                viewForImage.backgroundColor = .systemRed
            case .systemIndigo:
                viewForImage.backgroundColor = .systemIndigo
            case .systemGray:
                viewForImage.backgroundColor = .systemGray
            case .black:
                viewForImage.backgroundColor = .black
            default:
                viewForImage.backgroundColor = .none
            }
            
            label.text = setting?.label
            labelRight.text = setting?.labelDiscription
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
    
    private let imageNotification: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.image = UIImage(named: "messred")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let labelRight: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        return label
    }()
    
    private var stackView = UIStackView()
    
//MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarhyNotification()
        setupLayoutNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Setup
        
    private func setupHierarhyNotification() {
        stackView = UIStackView(arrangedSubviews: [viewForImage, label], axis: .horizontal, spasing: 10, distribution: .fill, aligment: nil)
        addSubview(stackView)
        viewForImage.addSubview(image)
        contentView.addSubview(imageNotification)
        contentView.addSubview(labelRight)
    }
    
    private func setupLayoutNotification() {
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
        imageNotification.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(self).offset(-40)
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
