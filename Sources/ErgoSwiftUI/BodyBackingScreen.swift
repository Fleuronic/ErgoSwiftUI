// Copyright © Fleuronic LLC. All rights reserved.

import WorkflowUI

import protocol Ergo.ScreenBacked

public protocol BodyBackingScreen: Screen where View.Screen == Self {
	associatedtype View: BodyProvider
}

// MARK: -
public extension BodyBackingScreen {
	// MARK: Screen
	func viewControllerDescription(environment: ViewEnvironment) -> ViewControllerDescription {
		.init(
			type: BodyViewController<View>.self,
			build: { .init(screen: self, environment: environment) },
			update: { $0.update(screen: self, environment: environment) }
		)
	}
}
