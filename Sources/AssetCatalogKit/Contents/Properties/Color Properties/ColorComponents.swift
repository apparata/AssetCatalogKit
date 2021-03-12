//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

public struct ColorComponents {
    
    public let red: String
    public let green: String
    public let blue: String
    public let alpha: String
    
    public init(red: String, green: String, blue: String, alpha: String) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    public init(red: Double, green: Double, blue: Double, alpha: Double) {
        self.red = String(format: "%.3f", red)
        self.green = String(format: "%.3f", green)
        self.blue = String(format: "%.3f", blue)
        self.alpha = String(format: "%.3f", alpha)
    }
}

// MARK: - Codable

extension ColorComponents: Codable { }
