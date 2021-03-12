//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// ```
/// let assetCatalog = AssetCatalog(name: "MyAssets", children: [...])
/// try assetCatalog.write(to: "/tmp/test-assets")
/// ```
public class AssetCatalog: ContentType {
    
    public let name: String
    
    public let children: [ContentType]
    
    public let fileExtension = "xcassets"
    
    public init(name: String, children: [ContentType]) {
        self.name = name
        self.children = children
    }
}
        
// MARK: - Codable

extension AssetCatalog {
    
    enum CodingKeys: String, CodingKey {
        case info
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(info, forKey: .info)
    }
}
