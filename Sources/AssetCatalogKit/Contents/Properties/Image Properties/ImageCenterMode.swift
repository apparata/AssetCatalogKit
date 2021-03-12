//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// The resizing mode of the central area of a resizing image.
/// If not included, there is no default behavior specified.
public enum ImageCenterMode: String {
    /// The central area is tiled to fill the available size.
    case tile
    
    /// The central area is stretched to fill the available size.
    case stretch
}

// MARK: - Codable

extension ImageCenterMode: Codable { }
