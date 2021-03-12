// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "AssetCatalogKit",
    platforms: [
        // Relevant platforms.
        .iOS(.v13), .macOS(.v10_15), .tvOS(.v13)
    ],
    products: [
        .library(name: "AssetCatalogKit", targets: ["AssetCatalogKit"])
    ],
    dependencies: [
        // It's a good thing to keep things relatively
        // independent, but add any dependencies here.
    ],
    targets: [
        .target(
            name: "AssetCatalogKit",
            dependencies: [],
            swiftSettings: [
                .define("DEBUG", .when(configuration: .debug)),
                .define("RELEASE", .when(configuration: .release)),
                .define("SWIFT_PACKAGE")
            ]),
        .testTarget(name: "AssetCatalogKitTests", dependencies: ["AssetCatalogKit"]),
    ]
)
