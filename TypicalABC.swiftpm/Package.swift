// swift-tools-version: 5.9

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "TypicalABC",
    platforms: [
        .iOS("17.5")
    ],
    products: [
        .iOSApplication(
            name: "TypicalABC",
            targets: ["AppModule"],
            bundleIdentifier: "emao.idserve.net.ssc.milo",
            teamIdentifier: "4XY84J5345",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .openBook),
            accentColor: .presetColor(.mint),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .landscapeRight,
                .landscapeLeft
            ],
            capabilities: [
                .camera(purposeString: "teste")
            ],
            appCategory: .education
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: ".",
            resources: [
                .process("Resources"),
                .copy("ML/MNISTClassifier.mlmodelc")
            ],
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals")
            ]
        )
    ]
)
