//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

public struct ColorSet: ContentType {
    
    public let name: String
    
    public let fileExtension = "colorset"
    
    public let colors: [ColorEntry]
    
    public init(name: String,
                colors: [ColorEntry]) {
        self.name = name
        self.colors = colors
    }
}

// MARK: - Codable

extension ColorSet: Encodable {
        
    enum CodingKeys: String, CodingKey {
        case info
        case colors
    }
        
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(info, forKey: .info)
        try container.encode(colors, forKey: .colors)
    }
}
