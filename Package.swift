// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "skip-ltc",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
        .library(name: "SkipLTC", type: .dynamic, targets: ["SkipLTC"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "0.8.19"),
        .package(url: "https://source.skip.tools/skip-ffi.git", from: "0.3.2"),
        .package(url: "https://source.skip.tools/skip-unit.git", from: "0.6.1"),
    ],
    targets: [
        .target(name: "SkipLTC", dependencies: [
            "LibTomCrypt",
            .product(name: "SkipFFI", package: "skip-ffi")
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipLTCTests", dependencies: [
            "SkipLTC",
            .product(name: "SkipTest", package: "skip")
        ], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "LibTomCrypt", dependencies: [
            .product(name: "SkipUnit", package: "skip-unit")
        ], sources: ["libtomcrypt"],
            publicHeadersPath: "libtomcrypt/headers",
            cSettings: [
                .headerSearchPath("libtomcrypt/headers"),
            ],
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        
    ]
)
