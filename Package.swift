// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftCommonLibrary",
    platforms: [.iOS(.v16), .macOS(.v11)],
    products: [
        .library(
            name: "SwiftCommonLibrary",
            targets: ["SwiftCommonLibrary"]),
    ],
    targets: [
        .target(
            name: "SwiftCommonLibrary"),
        .testTarget(
            name: "SwiftCommonLibraryTests",
            dependencies: ["SwiftCommonLibrary"]),
    ]
)
