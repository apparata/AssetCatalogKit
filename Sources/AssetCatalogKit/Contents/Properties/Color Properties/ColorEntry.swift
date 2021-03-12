//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

public struct ColorEntry {
    
    public let color: Color
    
    /// The device type for the image.
    public var idiom: Idiom = .universal
                    
    /// The color gamut of the device display.
    public var displayGamut: DisplayGamut? = nil
    
    /// Appearance variations of the color
    public var appearances: [Appearance] = []
    
    public init(color: Color,
                idiom: Idiom = .universal,
                displayGamut: DisplayGamut? = nil,
                appearances: [Appearance] = []) {
        self.color = color
        self.idiom = idiom
        self.appearances = appearances
        self.displayGamut = displayGamut
    }
}

// MARK: - Codable

extension ColorEntry: Codable {
    
    public enum CodingKeys: String, CodingKey {
        
        /// The idiom of the destination device
        case idiom
                    
        case color
        
        case displayGamut = "display-gamut"
        
        case appearances = "appearances"
    }

}
