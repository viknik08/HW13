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
}

struct Settings: Hashable {
    var image: UIImage
    var label: String
    var type: SettingType
}

extension Settings {
    static var settings: [[Settings]] = [
        [Settings(image: UIImage(named: "airplane")!, label: "Airplane Mode", type: .switcher),
         Settings(image: UIImage(named: "wifi")!, label: "Wi-Fi", type: .empty),
         Settings(image: UIImage(named: "bluetooth")!, label: "Bluetooth", type: .empty),
         Settings(image: UIImage(named: "mobileData")!, label: "Mobile Data", type: .empty),
         Settings(image: UIImage(named: "hotspot")!, label: "Personal Hotspot", type: .empty),
         Settings(image: UIImage(named: "vpn")!, label: "VPN", type: .switcher)],

        [Settings(image: UIImage(named: "notification")!, label: "Notifications", type: .empty),
         Settings(image: UIImage(named: "sound")!, label: "Sound & Haptics", type: .empty),
         Settings(image: UIImage(named: "disturb")!, label: "Do Not Disturb", type: .empty),
         Settings(image: UIImage(named: "screenTime")!, label: "Screen Time", type: .empty)],

        [Settings(image: UIImage(named: "general")!, label: "General", type: .notification),
         Settings(image: UIImage(named: "controlCentr")!, label: "Control Centr", type: .empty),
         Settings(image: UIImage(named: "display")!, label: "Display & Brightness", type: .notification),
         Settings(image: UIImage(named: "homeScreen")!, label: "Home Screen", type: .empty),
         Settings(image: UIImage(named: "siri")!, label: "Siri", type: .empty),
         Settings(image: UIImage(named: "touch")!, label: "Touch ID & Passcode", type: .empty),
         Settings(image: UIImage(named: "sos")!, label: "Emergency SOS", type: .empty),
         Settings(image: UIImage(named: "battery")!, label: "Battery", type: .empty),
         Settings(image: UIImage(named: "privacy")!, label: "Privacy", type: .empty)]
    ]
}
