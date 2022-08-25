//
//  Model.swift
//  HW13
//
//  Created by Виктор Басиев on 25.08.2022.
//

import UIKit

struct Settings {
    var image: UIImage
    var label: String
}

extension Settings {
    static var settings: [[Settings]] = [
    [Settings(image: UIImage(named: "airplane")!, label: "Airplane Mode"),
     Settings(image: UIImage(named: "wifi")!, label: "Wi-Fi"),
     Settings(image: UIImage(named: "bluetooth")!, label: "Bluetooth"),
     Settings(image: UIImage(named: "mobileData")!, label: "Mobile Data"),
     Settings(image: UIImage(named: "hotspot")!, label: "Personal Hotspot"),
     Settings(image: UIImage(named: "vpn")!, label: "VPN"),],
    [Settings(image: UIImage(named: "notification")!, label: "Notifications"),
     Settings(image: UIImage(named: "sound")!, label: "Sound & Haptics"),
     Settings(image: UIImage(named: "disturb")!, label: "Do Not Disturb"),
     Settings(image: UIImage(named: "screenTime")!, label: "Screen Time"),],
    [Settings(image: UIImage(named: "general")!, label: "General"),
     Settings(image: UIImage(named: "controlCentr")!, label: "Control Centr"),
     Settings(image: UIImage(named: "display")!, label: "Display & Brightness"),
     Settings(image: UIImage(named: "homeScreen")!, label: "Home Screen"),
     Settings(image: UIImage(named: "siri")!, label: "Siri"),
     Settings(image: UIImage(named: "touch")!, label: "Touch ID & Passcode"),
     Settings(image: UIImage(named: "sos")!, label: "Emergency SOS"),
     Settings(image: UIImage(named: "battery")!, label: "Battery"),
     Settings(image: UIImage(named: "privacy")!, label: "Privacy"),]
    ]
}
