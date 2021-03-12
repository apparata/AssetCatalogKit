//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// Used for resizing the image
public struct ImageCenter {
    
    /// The center resizing mode for the image
    public let mode: ImageCenterMode
    
    /// The width in pixels of the rectangle for the resizable area of the image.
    /// Only valid for modes of 3-part-horizontal and 9-part.
    public let width: Double?
    
    /// The height in pixels of the rectangle for the resizable area of the image.
    /// Only valid for modes of 3-part-vertical and 9-part.
    public let height: Double?
}

// MARK: - Codable

extension ImageCenter: Codable { }
