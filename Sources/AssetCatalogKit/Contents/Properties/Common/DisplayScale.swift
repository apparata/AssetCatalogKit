//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// The targeted display scale for the image
/// If not included, the image is for any display scale and should point to a .pdf file.
/// Encode as "scale"
public enum DisplayScale: String { // "screen-width, kebab case
    
    /// Targeted for unscaled displays.
    case unscaled = "1x"
    
    /// Targeted for Retina displays.
    case retina = "2x"
    
    /// Targeted for Retina displays with higher density such as those on the iPhone 6 Plus.
    case retinaPlus = "3x"
}

// MARK: - Codable

extension DisplayScale: Codable { }
