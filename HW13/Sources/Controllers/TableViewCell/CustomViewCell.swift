//
//  CustomViewCell.swift
//  HW13
//
//  Created by Виктор Басиев on 25.08.2022.
//

import UIKit

class CustomViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
