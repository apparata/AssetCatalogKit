//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

public struct Image: Encodable {
    
    /// The HEIF, .png, .jpg, or .pdf file for the image.
    public let filename: String
    
    /// The device type for the image.
    public var idiom: Idiom = .universal
    
    /// The color space for the item
    public var colorSpace: ColorSpace? = nil
    
    /// The compression used on the item.
    public var compressionType: ImageCompressionType? = nil
    
    /// The color gamut of the device display.
    public var displayGamut: DisplayGamut? = nil
    
    /// The graphics features required for the image.
    public var graphicsFeatureSet: GraphicsFeatureSet? = nil
    
    /// The horizontal display direction for the image.
    public var languageDirection: LanguageDirection? = nil
    
    /// The memory required by the data item.
    public var memory: Memory? = nil
    
    /// The scale of the image.
    public var scale: DisplayScale? = nil
    
    /// The Apple Watch screen width for the image.
    public var screenWidth: WatchScreenWidth? = nil
            
    /// The size class for the width of the image.
    public var widthClass: WidthClass? = nil

    /// The size class for the height of the image.
    public var heightClass: HeightClass? = nil
    
    /// The insets for alignmentRectInsets in UIImage or for alignmentRect in NSImage.
    public var alignmentInsets: ImageAlignmentInsets? = nil
    
    let data: AssetData
    
    public init(filename: String,
                data: AssetData,
                idiom: Idiom = .universal,
                colorSpace: ColorSpace? = nil,
                compressionType: ImageCompressionType? = nil,
                displayGamut: DisplayGamut? = nil,
                graphicsFeatureSet: GraphicsFeatureSet? = nil,
                languageDirection: LanguageDirection? = nil,
                memory: Memory? = nil,
                scale: DisplayScale? = nil,
                screenWidth: WatchScreenWidth? = nil,
                widthClass: WidthClass? = nil,
                heightClass: HeightClass? = nil,
                alignmentInsets: ImageAlignmentInsets? = nil) {
        self.filename = filename
        self.data = data
        
        self.idiom = idiom
        self.colorSpace = colorSpace
        self.compressionType = compressionType
        self.displayGamut = displayGamut
        self.graphicsFeatureSet = graphicsFeatureSet
        self.languageDirection = languageDirection
        self.memory = memory
        self.scale = scale
        self.screenWidth = screenWidth
        self.widthClass = widthClass
        self.heightClass = heightClass
        self.alignmentInsets = alignmentInsets
    }
    
    public enum CodingKeys: String, CodingKey {
        
        /// The file name of the image within the image set
        case filename
        
        /// The idiom of the destination device
        case idiom
        
        case colorSpace = "color-space"
        
        case compressionType = "compression-type"
        
        case displayGamut = "display-gamut"
        
        case graphicsFeatureSet = "graphics-feature-set"
        
        case languageDirection = "language-direction"
        
        /// The image's memory requirements
        case memory
        
        case scale
        
        /// The image's target screen width (for watch)
        case screenWidth = "screen-width"
        
        /// compact or regular
        case widthClass = "width-class"
        
        /// compact or regular
        case heightClass = "height-class"
        
        case alignmentInsets = "alignment-insets"
    }
            
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(filename, forKey: .filename)
        try container.encodeIfPresent(idiom, forKey: .idiom)
        try container.encodeIfPresent(colorSpace, forKey: .colorSpace)
        try container.encodeIfPresent(compressionType, forKey: .compressionType)
        try container.encodeIfPresent(displayGamut, forKey: .displayGamut)
        try container.encodeIfPresent(graphicsFeatureSet, forKey: .graphicsFeatureSet)
        try container.encodeIfPresent(languageDirection, forKey: .languageDirection)
        try container.encodeIfPresent(memory, forKey: .memory)
        try container.encodeIfPresent(scale, forKey: .scale)
        try container.encodeIfPresent(screenWidth, forKey: .screenWidth)
        try container.encodeIfPresent(widthClass, forKey: .widthClass)
        try container.encodeIfPresent(heightClass, forKey: .heightClass)
        try container.encodeIfPresent(alignmentInsets, forKey: .alignmentInsets)
    }
}
