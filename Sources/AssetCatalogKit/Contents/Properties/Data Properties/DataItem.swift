//
//  Copyright © 2023 Apparata AB. All rights reserved.
//

import Foundation

public struct DataItem: Encodable {
    
    /// The file for the data item.
    public let filename: String
    
    /// A type identifier for developers to determine which kind of data item they are accessing.
    /// At runtime, the value of this tag is accessed using the `typeIdentifer` property of
    /// type `NSDataAsset`.
    public let universalTypeIdentifier: String
    
    /// The device type for the data item.
    public var idiom: Idiom = .universal
    
    /// The color space for the item
    public var colorSpace: ColorSpace? = nil
        
    /// The color gamut of the device display.
    public var displayGamut: DisplayGamut? = nil
    
    /// The graphics features required for the image.
    public var graphicsFeatureSet: GraphicsFeatureSet? = nil
    
    /// The memory required by the data item.
    public var memory: Memory? = nil
    
    let data: AssetData
    
    public init(filename: String,
                universalTypeIdentifier: String,
                data: AssetData,
                idiom: Idiom = .universal,
                colorSpace: ColorSpace? = nil,
                displayGamut: DisplayGamut? = nil,
                graphicsFeatureSet: GraphicsFeatureSet? = nil,
                memory: Memory? = nil) {
        self.filename = filename
        self.universalTypeIdentifier = universalTypeIdentifier
        self.data = data
        
        self.idiom = idiom
        self.colorSpace = colorSpace
        self.displayGamut = displayGamut
        self.graphicsFeatureSet = graphicsFeatureSet
        self.memory = memory
    }
    
    public enum CodingKeys: String, CodingKey {
        
        /// The file name of the image within the image set
        case filename
        
        case universalTypeIdentifier = "universal-type-identifier"
        
        /// The idiom of the destination device
        case idiom
        
        case colorSpace = "color-space"
        
        case displayGamut = "display-gamut"
        
        case graphicsFeatureSet = "graphics-feature-set"
        
        /// The image's memory requirements
        case memory
    }
            
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(filename, forKey: .filename)
        try container.encodeIfPresent(universalTypeIdentifier, forKey: .universalTypeIdentifier)
        try container.encodeIfPresent(idiom, forKey: .idiom)
        try container.encodeIfPresent(colorSpace, forKey: .colorSpace)
        try container.encodeIfPresent(displayGamut, forKey: .displayGamut)
        try container.encodeIfPresent(graphicsFeatureSet, forKey: .graphicsFeatureSet)
        try container.encodeIfPresent(memory, forKey: .memory)
    }
}
