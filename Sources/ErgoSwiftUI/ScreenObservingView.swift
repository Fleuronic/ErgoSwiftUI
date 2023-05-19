// Copyright © Fleuronic LLC. All rights reserved.

import SwiftUI

struct ScreenObservingView<Content: BodyProvider> {
	private let content: Content

	@ObservedObject private var context: Context

	init(
		content: Content,
		context: Context
	) {
		self.content = content
		self.context = context
	}
}

// MARK: -
extension ScreenObservingView {
	final class Context: ObservableObject {
		@Published var screen: Content.Screen

		init(screen: Content.Screen) {
			self.screen = screen
		}
	}
}

// MARK: -
extension ScreenObservingView: SwiftUI.View {
	// MARK: View
	var body: some SwiftUI.View {
		content.body(with: context.screen)
	}
}
