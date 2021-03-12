//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// If not included, the asset uses the standard sRGB color space.
/// Encode as "color-space"
public enum ColorSpace: String {
    /// The asset uses the standard sRGB color space.
    case srgb
    
    /// The asset uses a wide gamut color space
    case displayP3 = "display-p3"
}

// MARK: - Codable

extension ColorSpace: Codable { }
