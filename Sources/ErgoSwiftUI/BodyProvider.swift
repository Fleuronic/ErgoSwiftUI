// Copyright © Fleuronic LLC. All rights reserved.

import protocol SwiftUI.View
import protocol Ergo.ScreenBacked

public protocol BodyProvider: ScreenBacked {
	associatedtype Body: View

	static func body(with screen: Screen) -> Body
}
