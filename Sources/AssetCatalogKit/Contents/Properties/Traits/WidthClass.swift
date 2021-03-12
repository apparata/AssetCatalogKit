//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// The size class for the image width.
/// If not included, the image width is for the `any` size class.
/// Encode as "width-class"
public enum WidthClass: String {
    /// The image width is for the `compact` size class.
    case compact
    
    /// The image width is for the `regular` size class.
    case regular
}

// MARK: - Codable

extension WidthClass: Codable { }
