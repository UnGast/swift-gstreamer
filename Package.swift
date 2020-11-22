// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GStreamer",
    products: [
        .library(
            name: "GStreamer",
            targets: ["GStreamer"]),
        .executable(
            name: "GStreamerExample",
            targets: ["GStreamerExample"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "GStreamer",
            dependencies: []),
        .systemLibrary(name: "CGStreamer", pkgConfig: "gstreamer-1.0"),
        .target(
            name: "GStreamerExample",
            dependencies: ["CGStreamer"]),
        .testTarget(
            name: "GStreamerTests",
            dependencies: ["GStreamer"]),
    ]
)
