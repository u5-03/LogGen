// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LogGen",
    products: [
        .executable(name: "LogGen", targets: ["LogGen"])
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/Stencil.git", from: "0.9.0"),
        .package(url: "https://github.com/SwiftGen/StencilSwiftKit.git", from: "2.0.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.0"),
       .package(url: "https://github.com/kylef/Commander.git", from: "0.9.1")
    ],
    targets: [
        .executableTarget(
            name: "LogGen",
            dependencies: ["LogGenCore", "Yams", "Commander"]),
        .target(
            name: "LogGenCore",
            dependencies: ["Stencil", "StencilSwiftKit"]),
        .testTarget(
            name: "LogGenTests",
            dependencies: ["LogGen"]),
    ]
)
