//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

public struct Group: ContentType {
        
    public let name: String
    
    public let fileExtension = ""
    
    public let properties: GroupProperties
    
    public let children: [ContentType]
    
    public init(name: String, properties: GroupProperties, children: [ContentType]) {
        self.name = name
        self.properties = properties
        self.children = children
    }
}
 
// MARK: - Codable

extension Group: Encodable {
    
    enum CodingKeys: String, CodingKey {
        case info
        case properties
    }
        
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(info, forKey: .info)
        try container.encode(properties, forKey: .properties)
    }
}
