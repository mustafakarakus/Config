// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Config",
    products: [
        .library(
            name: "Config",
            targets: ["Config"]),
    ],
    dependencies: [],
    targets: [ 
        .target(
            name: "Config",
            dependencies: []),
        .testTarget(
            name: "ConfigTests",
            dependencies: ["Config"]),
    ]
)