//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

public struct GroupProperties {
    
    public let providesNamespace: Bool
    
    public let onDemandResourceTags: [String]
    
    public init(providesNamespace: Bool = false,
                onDemandResourceTags: [String] = []) {
        self.providesNamespace = providesNamespace
        self.onDemandResourceTags = onDemandResourceTags
    }
}

// MARK: - Codable

extension GroupProperties: Encodable {
    
    enum CodingKeys: String, CodingKey {
        case providesNamespace = "provides-namespace"
        case onDemandResourceTags = "on-demand-resource-tags"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if providesNamespace {
            try container.encode(true, forKey: .providesNamespace)
        }
        if onDemandResourceTags.count > 0 {
            try container.encode(onDemandResourceTags, forKey: .onDemandResourceTags)
        }
    }
}
