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
        //.package(name: "GLib", url: "https://github.com/rhx/SwiftGLib.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "GStreamer",
            dependencies: ["CGStreamer", "CGStreamerHelpers", "CGLib"]),
        .systemLibrary(name: "CGStreamer", pkgConfig: "gstreamer-1.0", providers: [
            .brew(["gstreamer-1.0"])
        ]),
        .systemLibrary(name: "CGLib", pkgConfig: "glib-2.0 gio-unix-2.0",
            providers: [
                .brew(["glib", "glib-networking", "gobject-introspection"]),
                .apt(["libglib2.0-dev", "glib-networking", "gobject-introspection", "libgirepository1.0-dev"])
            ]),
        .target(
            name: "CGStreamerHelpers"
        ),
        .target(
            name: "GStreamerExample",
            dependencies: ["GStreamer", "CGStreamer", "CGStreamerHelpers"]),
        .testTarget(
            name: "GStreamerTests",
            dependencies: ["GStreamer"]),
    ]
)
