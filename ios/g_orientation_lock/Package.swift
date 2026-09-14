// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "g_orientation_lock",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .library(name: "g-orientation-lock", targets: ["g_orientation_lock"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "g_orientation_lock",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            resources: [
                /* Your resource paths here, for example:
                .process("Resources")
                 */
            ]
        )
    ]
)
