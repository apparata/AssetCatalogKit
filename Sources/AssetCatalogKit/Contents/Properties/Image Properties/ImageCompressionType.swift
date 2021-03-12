//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// The type of compression used for the item.
/// If not included, the compression type inherits from the parent.
/// The type is set to lossless compression if there is no parent.
/// Encode as "compression-type".
public enum ImageCompressionType: String, Codable {
    
    /// The compression type inherits from the parent.
    /// The type is set to lossless compression if there is no parent.
    case automatic
    
    /// The image uses a lossy GPU compression format optimized for quality.
    case gpuOptimizedBest = "gpu-optimized-best"
    
    /// The image uses a lossy GPU compression format optimized for memory size.
    case gpuOptimizedSmallest = "gpu-optimized-smallest"
    
    /// The image uses lossless compression.
    /// This is the default if the compresson-type tag is not included.
    case lossless
    
    /// The image uses basic lossy compression.
    case lossy
}
