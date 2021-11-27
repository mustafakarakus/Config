// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Config",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "Config",
            targets: ["Config"]),
    ],
    dependencies: [],
    targets: [ 
        .target(
            name: "Config",
            dependencies: [],
            path: "Sources/Config",
            exclude: [
                 "Info.plist"
            ]
        ),
        .testTarget(
            name: "ConfigTests",
            dependencies: ["Config"],
            path: "Tests/ConfigTests",
            exclude: [
                 "Info.plist"
            ]
        ),
    ]
)