//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

public struct Color {
    
    /// The color space for the item
    public var colorSpace: ColorSpace? = nil
    
    public var components: ColorComponents
    
    public init(colorSpace: ColorSpace? = nil,
                components: ColorComponents) {
        self.colorSpace = colorSpace
        self.components = components
    }
}

// MARK: - Codable

extension Color: Codable {

    public enum CodingKeys: String, CodingKey {
        case colorSpace = "color-space"
        case components
    }
}
