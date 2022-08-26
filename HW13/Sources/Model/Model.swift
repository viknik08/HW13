//
//  Model.swift
//  HW13
//
//  Created by Виктор Басиев on 25.08.2022.
//

import UIKit

enum SettingType {
    case switcher
    case notification
    case label
    case empty
    case title
}

struct Settings: Hashable {
    var image: UIImage
    var label: String
    var type: SettingType
    var labelDiscription: String?
    
    init(image: UIImage, label: String, type: SettingType, labelDiscription: String?) {
        self.image = image
        self.label = label
        self.type = type
        self.labelDiscription = labelDiscription
    }
}

extension Settings {
    static var settings: [[Settings]] = [
        [Settings(image: UIImage(named: "1")!, label: "Viktor Basiev", type: .title, labelDiscription: "Apple ID, iCloude, Media & Purchases")],
        
        [Settings(image: UIImage(named: "airplane")!, label: "Airplane Mode", type: .switcher, labelDiscription: nil),
         Settings(image: UIImage(named: "wifi")!, label: "Wi-Fi", type: .label, labelDiscription: "Not Connected"),
         Settings(image: UIImage(named: "bluetooth")!, label: "Bluetooth", type: .label, labelDiscription: "Off"),
         Settings(image: UIImage(named: "mobileData")!, label: "Mobile Data", type: .empty, labelDiscription: nil),
         Settings(image: UIImage(named: "hotspot")!, label: "Personal Hotspot", type: .label, labelDiscription: "Off"),
         Settings(image: UIImage(named: "vpn")!, label: "VPN", type: .switcher, labelDiscription: nil)],

        [Settings(image: UIImage(named: "notification")!, label: "Notifications", type: .empty, labelDiscription: nil),
         Settings(image: UIImage(named: "sound")!, label: "Sound & Haptics", type: .empty, labelDiscription: nil),
         Settings(image: UIImage(named: "disturb")!, label: "Do Not Disturb", type: .empty, labelDiscription: nil),
         Settings(image: UIImage(named: "screenTime")!, label: "Screen Time", type: .empty, labelDiscription: nil)],

        [Settings(image: UIImage(named: "general")!, label: "General", type: .notification, labelDiscription: nil),
         Settings(image: UIImage(named: "controlCentr")!, label: "Control Centr", type: .empty, labelDiscription: nil),
         Settings(image: UIImage(named: "display")!, label: "Display & Brightness", type: .notification, labelDiscription: nil),
         Settings(image: UIImage(named: "homeScreen")!, label: "Home Screen", type: .empty, labelDiscription: nil),
         Settings(image: UIImage(named: "siri")!, label: "Siri", type: .empty, labelDiscription: nil),
         Settings(image: UIImage(named: "touch")!, label: "Touch ID & Passcode", type: .empty, labelDiscription: nil),
         Settings(image: UIImage(named: "sos")!, label: "Emergency SOS", type: .empty, labelDiscription: nil),
         Settings(image: UIImage(named: "battery")!, label: "Battery", type: .empty, labelDiscription: nil),
         Settings(image: UIImage(named: "privacy")!, label: "Privacy", type: .empty, labelDiscription: nil)]
    ]
}
