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

enum ColorForBackground {
    case systemBlue
    case systemOrange
    case systemGreen
    case systemRed
    case systemIndigo
    case systemGray
    case black
}

struct Settings: Hashable {
    var image: String
    var label: String
    var type: SettingType
    var labelDiscription: String?
    var isSystemName: Bool
    var backgroundColor: ColorForBackground?
}

final class SettingsModel {
    
    func setupSettings() -> [[Settings]] {
        return [
            [Settings(image: "1", label: "Viktor Basiev", type: .title, labelDiscription: "Apple ID, iCloude, Media & Purchases", isSystemName: false)],
            
            [Settings(image: "airplane", label: "Airplane Mode", type: .switcher, labelDiscription: nil, isSystemName: true, backgroundColor: .systemOrange),
             Settings(image: "wifi", label: "Wi-Fi", type: .label, labelDiscription: "Not Connected", isSystemName: true, backgroundColor: .systemBlue),
             Settings(image: "bluetoothN", label: "Bluetooth", type: .label, labelDiscription: "Off", isSystemName: false, backgroundColor: .systemBlue),
             Settings(image: "antenna.radiowaves.left.and.right", label: "Mobile Data", type: .empty, labelDiscription: nil, isSystemName: true, backgroundColor: .systemGreen),
             Settings(image: "personalhotspot", label: "Personal Hotspot", type: .label, labelDiscription: "Off", isSystemName: true, backgroundColor: .systemGreen),
             Settings(image: "vpnN", label: "VPN", type: .switcher, labelDiscription: nil, isSystemName: false, backgroundColor: .systemBlue)],

            [Settings(image: "bell.badge.fill", label: "Notifications", type: .empty, labelDiscription: nil, isSystemName: true, backgroundColor: .systemRed),
             Settings(image: "speaker.wave.3.fill", label: "Sound & Haptics", type: .empty, labelDiscription: nil, isSystemName: true, backgroundColor: .systemRed),
             Settings(image: "moon.fill", label: "Do Not Disturb", type: .empty, labelDiscription: nil, isSystemName: true, backgroundColor: .systemIndigo),
             Settings(image: "hourglass", label: "Screen Time", type: .empty, labelDiscription: nil, isSystemName: true, backgroundColor: .systemIndigo)],

            [Settings(image: "gear", label: "General", type: .notification, labelDiscription: nil, isSystemName: true, backgroundColor: .systemGray),
             Settings(image: "switch.2", label: "Control Centr", type: .empty, labelDiscription: nil, isSystemName: true, backgroundColor: .systemGray),
             Settings(image: "textformat.size", label: "Display & Brightness", type: .notification, labelDiscription: nil, isSystemName: true, backgroundColor: .systemBlue),
             Settings(image: "square.grid.3x3.bottommiddle.filled", label: "Home Screen", type: .empty, labelDiscription: nil, isSystemName: true, backgroundColor: .systemBlue),
             Settings(image: "siriN", label: "Siri", type: .empty, labelDiscription: nil, isSystemName: false, backgroundColor: .black),
             Settings(image: "faceid", label: "Touch ID & Passcode", type: .empty, labelDiscription: nil, isSystemName: true, backgroundColor: .systemRed),
             Settings(image: "sosN", label: "Emergency SOS", type: .empty, labelDiscription: nil, isSystemName: false, backgroundColor: .systemRed)],
            
            [Settings(image: "appstore", label: "App Store", type: .empty, labelDiscription: nil, isSystemName: false, backgroundColor: .systemBlue),
             Settings(image: "wallet", label: "Wallet", type: .empty, labelDiscription: nil, isSystemName: false, backgroundColor: .black)]
        ]
    }
}
