//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

public struct Info {
    let version: Int = 1
    let author: String = "xcode"
}

// MARK: - Codable

extension Info: Encodable { }
