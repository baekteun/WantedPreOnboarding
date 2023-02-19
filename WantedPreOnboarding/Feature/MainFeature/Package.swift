// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MainFeature",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "MainFeature",
            targets: ["MainFeature"]
        ),
        .library(
            name: "MainFeatureInterface",
            targets: ["MainFeatureInterface"]
        )
    ],
    dependencies: [
        .package(path: "./BaseFeature"),
        .package(path: "../Shared")
    ],
    targets: [
        .target(
            name: "MainFeature",
            dependencies: [
                "MainFeatureInterface",
                .product(name: "BaseFeature", package: "BaseFeature"),
                .product(name: "CombineUtil", package: "Shared"),
                .product(name: "ImageDownloader", package: "Shared"),
                .product(name: "UIViewUtil", package: "Shared")
            ]
        ),
        .target(name: "MainFeatureInterface"),
        .testTarget(
            name: "MainFeatureTests",
            dependencies: ["MainFeature"]
        ),
    ]
)
