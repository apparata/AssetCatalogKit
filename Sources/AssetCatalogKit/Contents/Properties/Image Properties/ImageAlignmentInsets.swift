//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// The insets for alignmentRectInsets in UIImage or for alignmentRect in NSImage.
/// The inset tag can be omitted.
/// Encode as "alignment-insets"
public struct ImageAlignmentInsets {
    
    /// The top inset in pixels.
    public let top: Double
    
    /// The bottom inset in pixels.
    public let bottom: Double
    
    /// The left inset in pixels.
    public let left: Double
    
    /// The right inset in pixels.
    public let right: Double
    
    /// The attributes for a resizable image.
    /// Only included with resizable images.
    public let resizing: ImageResizing?
}

// MARK: - Codable

extension ImageAlignmentInsets: Codable { }
