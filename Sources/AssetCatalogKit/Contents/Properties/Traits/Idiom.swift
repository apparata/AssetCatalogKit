//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// The device family.
/// Encode as "idiom"
public enum Idiom: String {
    /// The image works on any device and platform.
    case universal
    
    /// The image is for iPhone devices.
    case iphone
    
    /// The image is for iPad devices.
    case ipad
    
    /// The image is for Mac computers.
    case mac
    
    /// The image is for Apple TV.
    case tv
    
    /// The image is for the Apple Watch devices.
    case watch
    
    /// An image shown app launcher on watchOS
    case appLauncher
    
    /// An image for the Apple Watch Settings app
    case companionSettings
    
    /// An image for the notification center on watchOS.
    case notificationCenter
    
    /// An image used for a long look on watchOS.
    case quickLook
    
    /// An image for the App Store icon
    case iosMarketing = "ios-marketing"
    
    /// An image for the App Store icon.
    case watchMarketing = "watch-marketing"
}

// MARK: - Codable

extension Idiom: Codable { }
