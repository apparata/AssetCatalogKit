//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// The inset from the edges of the image to the resizable area.
/// Encode as "cap-insets"
public struct ImageCapInsets {
    
    /// The height in pixels of the non-resizable slice on the top of the image.
    public let top: Double
    
    /// The height in pixels of the non-resizable slice on the bottom of the image.
    public let bottom: Double
    
    /// The width in pixels of the non-resizable slice on the left of the image.
    public let left: Double
    
    /// The width in pixels of the non-resizable slice on the right of the image.
    public let right: Double
}

// MARK: - Codable

extension ImageCapInsets: Codable { }
