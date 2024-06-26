// Copyright © Fleuronic LLC. All rights reserved.

import Ergo
import ErgoSwiftUI
import XCTest
import SnapshotTesting

public func assertView<View: BodyProvider>(ofType type: View.Type, named name: String, backedBy screen: View.Screen, matchesSnapshotIn filePath: String) {
	let size = UIWindow().bounds.size

	XCTAssertNil(
		verifySnapshot(
			matching: View
				.body(with: screen)
				.frame(
					width: size.width,
					height: size.height
				),
			as: .image,
			named: "Snapshot",
			snapshotDirectory: filePath
				.components(separatedBy: ".")
				.dropLast(1)
				.joined()
				.components(separatedBy: "/")
				.dropLast(1)
				.joined(separator: "/")
				.appending("/Resources"),
			testName: name
		)
	)
}
