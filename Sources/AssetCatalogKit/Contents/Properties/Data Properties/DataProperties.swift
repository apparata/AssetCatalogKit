//
//  Copyright © 2023 Apparata AB. All rights reserved.
//

import Foundation

public struct DataProperties {
        
    public let onDemandResourceTags: [String]

    public init(onDemandResourceTags: [String] = []) {
        self.onDemandResourceTags = onDemandResourceTags
    }
    
}

// MARK: - Codable

extension DataProperties: Encodable {
    
    enum CodingKeys: String, CodingKey {
        case onDemandResourceTags = "on-demand-resource-tags"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if onDemandResourceTags.count > 0 {
            try container.encode(onDemandResourceTags, forKey: .onDemandResourceTags)
        }
    }
}
