// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "ErgoSwiftUI",
    platforms: [
        .iOS(.v16)
    ],
    products: [
		.library(
			name: "ErgoSwiftUI",
			targets: ["ErgoSwiftUI"]
		)
    ],
    dependencies: [
		.package(url: "https://github.com/Fleuronic/Ergo", branch: "main")
    ],
    targets: [
		.target(
			name: "ErgoSwiftUI",
			dependencies: ["Ergo"]
		)
    ]
)
