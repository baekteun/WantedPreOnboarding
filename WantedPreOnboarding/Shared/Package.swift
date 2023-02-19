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
        ),
        .library(
            name: "UIViewUtil",
            targets: ["UIViewUtil"]
        ),
        .library(
            name: "CombineUtil",
            targets: ["CombineUtil"]
        )
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "ImageDownloader",
            dependencies: []
        ),
        .target(name: "UIViewUtil"),
        .target(name: "CombineUtil")
    ]
)
