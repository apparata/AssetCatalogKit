//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// The screen width for the Apple Watch.
/// If not included, the image is for any Apple Watch screen.
/// Encode as "screen-width"
public enum WatchScreenWidth: String {

    /// Screen width for the 38mm, 40mm Apple Watch screen.
    case small = "<=145"
    
    /// Screen width for the 42mm, 44mm Apple Watch screen.
    case notSmall = ">145"
}

// MARK: - Codable

extension WatchScreenWidth: Codable { }
