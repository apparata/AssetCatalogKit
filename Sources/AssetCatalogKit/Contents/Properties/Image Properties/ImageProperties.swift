//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

public struct ImageProperties {
        
    public let preservesVectorRepresentation: Bool
    
    public let onDemandResourceTags: [String]
    
    /// Specifies if the image is a template for use with visual effects such as replacing colors.
    public var templateRenderingIntent: ImageTemplateRenderingIntent? = nil
    
    public init(preservesVectorRepresentation: Bool = false,
                onDemandResourceTags: [String] = [],
                templateRenderingIntent: ImageTemplateRenderingIntent? = nil) {
        self.preservesVectorRepresentation = preservesVectorRepresentation
        self.onDemandResourceTags = onDemandResourceTags
        self.templateRenderingIntent = templateRenderingIntent
    }
    
}

// MARK: - Codable

extension ImageProperties: Encodable {
    
    enum CodingKeys: String, CodingKey {
        case preservesVectorRepresentation = "preserves-vector-representation"
        case onDemandResourceTags = "on-demand-resource-tags"
        case templateRenderingIntent = "template-rendering-intent"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if preservesVectorRepresentation {
            try container.encode(true, forKey: .preservesVectorRepresentation)
        }
        if onDemandResourceTags.count > 0 {
            try container.encode(onDemandResourceTags, forKey: .onDemandResourceTags)
        }
        try container.encodeIfPresent(templateRenderingIntent, forKey: .templateRenderingIntent)
    }
}
