//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// The minimum device memory configuration required by the data item.
/// If not included, the data item works on any device.
/// Encode as "memory"
public enum Memory: String {

    /// The device needs at least a 1GB memory configuration.
    case oneGB = "1GB"
    
    /// The device needs at least a 2GB memory configuration.
    case twoGB = "2GB"
    
    /// The device needs at least a 3GB memory configuration.
    case threeGB = "3GB"
    
    /// The device needs at least a 4GB memory configuration.
    case fourGB = "4GB"
}

// MARK: - Codable

extension Memory: Codable { }
