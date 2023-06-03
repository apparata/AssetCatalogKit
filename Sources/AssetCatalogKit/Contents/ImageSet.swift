//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

public struct ImageSet: ContentType {
    
    public let name: String
    
    public let fileExtension = "imageset"
    
    public let properties: ImageProperties
    
    public let images: [Image]
    
    public init(name: String,
                properties: ImageProperties,
                images: [Image]) {
        self.name = name
        self.properties = properties
        self.images = images
    }
    
    public func write(to path: String) throws {
        let folder = Path(path)
            .appendingComponent(name)
            .appendingExtension(fileExtension)
        try folder.createDirectory(withIntermediateDirectories: true)
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        let json = try encoder.encode(self)
        try json.write(to: folder.url.appendingPathComponent("Contents").appendingPathExtension("json"))

        for image in images {
            let imagePath = folder.appendingComponent(image.filename)
            switch image.data {
            case .data(let data):
                try data.write(to: imagePath.url)
            case .url(let url):
                let data = try Data(contentsOf: url)
                try data.write(to: imagePath.url)
            }
        }
    }
}

// MARK: - Codable

extension ImageSet: Encodable {
        
    enum CodingKeys: String, CodingKey {
        case info
        case properties
        case images
    }
        
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(info, forKey: .info)
        try container.encode(properties, forKey: .properties)
        try container.encode(images, forKey: .images)
    }
}
