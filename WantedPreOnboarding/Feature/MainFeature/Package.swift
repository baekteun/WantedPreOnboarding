// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MainFeature",
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
        
    ],
    targets: [
        .target(
            name: "MainFeature",
            dependencies: ["MainFeatureInterface"]
        ),
        .target(name: "MainFeatureInterface"),
        .testTarget(
            name: "MainFeatureTests",
            dependencies: ["MainFeature"]
        ),
    ]
)
