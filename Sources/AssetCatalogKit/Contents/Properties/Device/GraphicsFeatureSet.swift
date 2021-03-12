//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// The graphics feature set required for the item.
/// The values correspond to values in the MTLFeatureSet enumerated type.
/// The keys are based on the iOS types. tvOS uses the GPU and OS revision level equivalent keys.
/// For example, metal2v3 corresponds to MTLFeatureSet_iOS_GPUFamily2_v3 on iOS and
/// to MTLFeatureSet_tvOS_GPUFamily1_v2 on tvOS.
/// If not included, the item works with any device that has at least OpenGL ES 2.0.
/// Encode as "graphics-feature-set".
public enum GraphicsFeatureSet: String {
    /// The item requires features in MTLFeatureSet_iOS_GPUFamily1_v2.
    case metal1v2
    
    /// The item features in MTLFeatureSet_iOS_GPUFamily1_v3.
    case metal1v3
    
    /// The item requires features in MTLFeatureSet_iOS_GPUFamily2_v2 and MTLFeatureSet_tvOS_GPUFamily1_v1.
    case metal2v2
    
    /// The item requires features in MTLFeatureSet_iOS_GPUFamily2_v3 and MTLFeatureSet_tvOS_GPUFamily1_v2.
    case metal2v3
    
    /// The item requires features in MTLFeatureSet_iOS_GPUFamily3_v1.
    case metal3v1
    
    /// The item requires features in MTLFeatureSet_iOS_GPUFamily3_v2.
    case metal3v2
    
    /// The item requires features in iOS_GPUFamily4_v1.
    case metal4v1
}

// MARK: - Codable

extension GraphicsFeatureSet: Codable { }
