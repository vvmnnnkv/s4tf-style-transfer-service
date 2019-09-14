// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VaporApp",
    products: [
        .library(name: "VaporApp", targets: ["App"]),
    ],
    dependencies: [
        .package(url: "https://github.com/joscdk/vapor", .branch("fix-foundation-networking-on-5-1-linux")),
        .package(url: "https://github.com/vvmnnnkv/s4tf-fast-style-transfer.git", .branch("master")),
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "FastStyleTransfer"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)
