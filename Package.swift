// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealBigoAdsAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealBigoAdsAdapter",
            targets: ["AppodealBigoAdsAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/bigo-ads/BigoADS-Swift-Package", exact: "6.1.0"),
    ],
    targets: [
        .target(
            name: "AppodealBigoAdsAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "BigoADS", package: "BigoADS-Swift-Package"),
                .target(name: "AppodealBigoAdsAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"],
            linkerSettings: [.linkedLibrary("c++")]
        ),
        .binaryTarget(
            name: "AppodealBigoAdsAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealBigoAdsAdapter/6.1.0.0/6c644a78cb6f/AppodealBigoAdsAdapter.xcframework.zip",
            checksum: "6c644a78cb6fc04c8ea40bcfb52513aae917522cddddc55164decbf2db778d72"
        ),

    ]
)
