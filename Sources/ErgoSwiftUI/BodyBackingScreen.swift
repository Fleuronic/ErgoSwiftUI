// Copyright © Fleuronic LLC. All rights reserved.

import SwiftUI
import WorkflowUI
import Inject

public protocol BodyBackingScreen: Screen where View.Screen == Self {
	associatedtype View: BodyProvider
}

// MARK: -
public extension BodyBackingScreen {
	// MARK: Screen
	func viewControllerDescription(environment: ViewEnvironment) -> ViewControllerDescription {
		.init(
			type: Inject.ViewControllerHost<BodyViewController<View>>.self,
			build: { .init(.init(screen: self, environment: environment)) },
			update: { $0.instance.update(screen: self, environment: environment) }
		)
	}
}
