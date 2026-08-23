// swift-tools-version:6.2

import PackageDescription

let package = Package(
    name: "Unwrap",
    products: [
        .library(
            name: "Unwrap",
            targets: ["Unwrap"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Unwrap",
            dependencies: []),
        .testTarget(
            name: "UnwrapTests",
            dependencies: ["Unwrap"]),
    ]
)
