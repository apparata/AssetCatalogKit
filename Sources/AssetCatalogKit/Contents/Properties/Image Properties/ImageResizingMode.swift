//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// The mode for a sliced resizable image.
/// If not included, the entire image is resized.
public enum ImageResizingMode: String {
    /// The image is divided into three horizontal parts.
    /// The outer portions are fixed-width.
    /// The central portion resizes in the horizontal dimension.
    case threePartHorizontal = "3-part-horizontal"
    
    /// The image is divided into three vertical parts.
    /// The outer portions are fixed-height.
    /// The central portion resizes in the vertical dimension.
    case threePartVertical = "3-part-vertical"
    
    /// The image is divided into nine parts.
    /// There is a central area that resizes in the horizontal and vertical dimensions,
    /// fixed-width vertical caps at the left and right of the central area,
    /// fixed-height caps at the top and bottom of the central area, and
    /// four fixed-size corner parts.
    case ninePart = "9-part"
}

// MARK: - Codable

extension ImageResizingMode: Codable { }
