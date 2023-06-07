// Copyright © Fleuronic LLC. All rights reserved.

import SwiftUI

struct ScreenObservingView<Content: BodyProvider> {
	private let contentType: Content.Type

	@ObservedObject private var context: Context

	init(
		contentType: Content.Type,
		context: Context
	) {
		self.contentType = contentType
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
		contentType.body(with: context.screen)
	}
}
