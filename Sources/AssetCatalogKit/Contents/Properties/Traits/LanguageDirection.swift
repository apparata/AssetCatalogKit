//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// The horizontal display direction of the image for left-to-right and right-to-left languages.
/// If not included, the image has a fixed horizontal orientation and will display in the same direction.
/// Encode as "language-direction".
public enum LanguageDirection: String {
    /// The image is used for display in left-to-right languages.
    /// The image is mirrored in right-to-left languages unless a right-to-left version of the image is provided.
    case leftToRight = "left-to-right"
    
    /// The image is used for display in right-to-left languages.
    /// The image is mirrored in left-to-right languages unless a left-to-right version of the image is provided.
    case rightToLeft = "right-to-left"
}

// MARK: - Codable

extension LanguageDirection: Codable { }
