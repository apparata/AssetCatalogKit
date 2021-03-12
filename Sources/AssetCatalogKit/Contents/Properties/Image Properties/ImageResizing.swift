//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// The attributes for a resizable image.
/// Only included with resizable images.
public struct ImageResizing {

    /// The mode for a sliced resizable image.
    /// If not included, the entire image is resized.
    public let mode: ImageResizingMode

    /// The center resizing for the image
    public let center: ImageCenter
    
    /// The inset from the edges of the image to the resizable area.
    public let capInsets: ImageCapInsets
    
    public enum CodingKeys: String, CodingKey {
        case mode
        case center
        case capInsets = "cap-insets"
    }
}

// MARK: - Codable

extension ImageResizing: Codable { }
