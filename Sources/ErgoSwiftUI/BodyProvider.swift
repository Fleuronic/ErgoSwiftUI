// Copyright © Fleuronic LLC. All rights reserved.

import SwiftUI
import WorkflowUI

public protocol BodyProvider {
	associatedtype Body: SwiftUI.View
	associatedtype Screen: WorkflowUI.Screen

	init()

	func body(with screen: Screen) -> Body
}
