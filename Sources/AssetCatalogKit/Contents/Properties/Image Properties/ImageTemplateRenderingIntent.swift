//
//  Copyright © 2020 Apparata AB. All rights reserved.
//

import Foundation

/// Indicates if the image is a renderable image or is a template for.
/// If not included and the name of the image ends in "Template", use the
/// image as a template, otherwise render it as the original image.
/// Encode as "template-rendering-intent"
public enum ImageTemplateRenderingIntent: String {
    /// Render as the original image.
    case original
    
    /// Use the image as a template for visual effects such as replacing colors.
    case template
}

// MARK: - Codable

extension ImageTemplateRenderingIntent: Codable { }
