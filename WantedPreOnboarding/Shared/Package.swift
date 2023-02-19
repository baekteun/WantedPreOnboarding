// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Shared",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "ImageDownloader",
            targets: ["ImageDownloader"]
        )
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "ImageDownloader",
            dependencies: []
        )
    ]
)
