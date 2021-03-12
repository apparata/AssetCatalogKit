//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// The size class for the image height.
/// If not included, the image height is for the `any` size class.
/// Encode as "height-class"
public enum HeightClass: String {
    /// The image height is for the `compact` size class.
    case compact
    
    /// The image height is for the `regular` size class.
    case regular
}

// MARK: - Codable

extension HeightClass: Codable { }
