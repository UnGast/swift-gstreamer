// swift-tools-version:5.3
import PackageDescription/*
import Foundation

func getPkgConfigFlags(_ flagType: String, _ package: String) -> [String] {
    func getIncludeFlags()

    let command = Process()
    command.launchPath = "/usr/bin/pkg-config"
    command.arguments = ["--cflags", "gstreamer-1.0"]

    let pipe = Pipe()
    command.standardOutput = pipe

    try! command.run()
    command.waitUntilExit()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()

    if let output: String = String(data: data, encoding: .utf8) {
        print("COMMAND OUTPUT", output)
    } else {
        print("NO COMMAND OUTPUT")
    }
}*/

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
        .systemLibrary(name: "CGStreamer", pkgConfig: "gstreamer-1.0 glib-2.0", providers: [
            .brew(["gstreamer-1.0"]),
            .apt(["libgstreamer1.0-dev", "libglib2.0-dev"])
        ]),
        .systemLibrary(name: "CGLib", pkgConfig: "glib-2.0 gio-unix-2.0",
            providers: [
                .brew(["glib", "glib-networking", "gobject-introspection"]),
                .apt(["libglib2.0-dev", "glib-networking", "gobject-introspection", "libgirepository1.0-dev"])
            ]),
        .target(
            name: "CGStreamerHelpers",
            linkerSettings: [.linkedLibrary("gstapp-1.0")]
        ),
        .target(
            name: "GStreamerExample",
            dependencies: ["GStreamer", "CGStreamer", "CGStreamerHelpers"]),
        .testTarget(
            name: "GStreamerTests",
            dependencies: ["GStreamer"]),
    ]
)
