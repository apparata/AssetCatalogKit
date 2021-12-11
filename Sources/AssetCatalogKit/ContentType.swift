//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

public protocol ContentType: Encodable {
    
    var name: String { get }
    
    var fileExtension: String { get }
    
    var info: Info { get }
    
    var children: [ContentType] { get }
    
    func write(to path: String) throws
}

public extension ContentType {
    
    var info: Info { return Info() }
    
    var children: [ContentType] { return [] }
    
    func write(to path: String) throws {
        let folder = Path(path)
            .appendingComponent(name)
            .appendingExtension(fileExtension)
        if folder.exists {
            try folder.remove()
        }
        try folder.createDirectory(withIntermediateDirectories: true)
        let encoder = JSONEncoder()
        let json = try encoder.encode(self)
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        try json.write(to: folder.url.appendingPathComponent("Contents").appendingPathExtension("json"))
        
        for child in children {
            try child.write(to: folder.string)
        }
    }
}
