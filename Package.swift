// swift-tools-version:5.7
import PackageDescription

let package = Package(
	name: "ErgoSwiftUI",
	platforms: [
		.iOS(.v13),
		.macOS(.v10_15),
		.tvOS(.v13),
		.watchOS(.v6)
	],
	products: [
		.library(
			name: "ErgoSwiftUI",
			targets: ["ErgoSwiftUI"]
		),
		.library(
			name: "ErgoSwiftUITesting",
			targets: ["ErgoSwiftUITesting"]
		)
	],
	dependencies: [
		.package(url: "https://github.com/Fleuronic/Ergo", branch: "main"),
		.package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.10.0")
	],
	targets: [
		.target(
			name: "ErgoSwiftUI",
			dependencies: ["Ergo"]
		),
		.target(
			name: "ErgoSwiftUITesting",
			dependencies: [
				"ErgoSwiftUI",
				.product(name: "SnapshotTesting", package: "swift-snapshot-testing")
			]
		)
	]
)
