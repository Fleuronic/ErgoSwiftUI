// Copyright © Fleuronic LLC. All rights reserved.

import SwiftUI
import Workflow

struct ScreenObservingView<View: BodyProvider> where View.Screen: BodyBackingScreen {
	private let view: View

	@ObservedObject
	private var screenPublisher: ScreenPublisher<View.Screen>

	init(
		view: View,
		screenPublisher: ScreenPublisher<View.Screen>
	) {
		self.view = view
		self.screenPublisher = screenPublisher
	}
}

// MARK: -
extension ScreenObservingView: SwiftUI.View {
	var body: some SwiftUI.View {
		view.body(with: screenPublisher.screen)
	}
}
