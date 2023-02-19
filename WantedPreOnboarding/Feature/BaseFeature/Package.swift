// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BaseFeature",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "BaseFeature",
            targets: ["BaseFeature"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BaseFeature",
            dependencies: []
        ),
        .testTarget(
            name: "BaseFeatureTests",
            dependencies: ["BaseFeature"]
        ),
    ]
)