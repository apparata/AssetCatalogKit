//
//  Copyright © 2023 Apparata AB. All rights reserved.
//

import Foundation

public struct DataSet: ContentType {
    
    public let name: String
    
    public let fileExtension = "dataset"
    
    public let properties: DataProperties
    
    public let data: [DataItem]
    
    public init(name: String,
                properties: DataProperties,
                data: [DataItem]) {
        self.name = name
        self.properties = properties
        self.data = data
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

        for dataItem in data {
            let dataItemPath = folder.appendingComponent(dataItem.filename)
            switch dataItem.data {
            case .data(let data):
                try data.write(to: dataItemPath.url)
            case .url(let url):
                let data = try Data(contentsOf: url)
                try data.write(to: dataItemPath.url)
            }
        }
    }
}

// MARK: - Codable

extension DataSet: Encodable {
        
    enum CodingKeys: String, CodingKey {
        case info
        case properties
        case data
    }
        
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(info, forKey: .info)
        try container.encode(properties, forKey: .properties)
        try container.encode(data, forKey: .data)
    }
}
