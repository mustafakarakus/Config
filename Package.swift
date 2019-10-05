// swift-tools-version:4.2

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