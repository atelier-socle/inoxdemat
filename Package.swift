// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InoxDemat",
    products: [
        .library(name: "InoxDemat", targets: ["InoxDemat"])
    ],
    targets: [
        .target(
            name: "InoxDemat",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "InoxDematTests",
            dependencies: ["InoxDemat"],
            resources: [.process("Resources")]
        )
    ]
)
