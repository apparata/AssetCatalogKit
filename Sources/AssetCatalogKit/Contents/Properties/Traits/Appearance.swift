//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

public enum AppearanceType: String {
    case luminosity
    case contrast
}

public enum AppearanceValue: String {
    // Only valid for appearance type `.luminosity`
    case dark
    
    // Only valid for appearance type `.contrast`
    case high
}

public struct Appearance {
        
    public let appearance: AppearanceType
    public let value: AppearanceValue
    
    public init(appearance: AppearanceType, value: AppearanceValue) {
        self.appearance = appearance
        self.value = value
    }
}

// MARK: - Codable

extension Appearance: Codable { }

extension AppearanceType: Codable { }

extension AppearanceValue: Codable { }
