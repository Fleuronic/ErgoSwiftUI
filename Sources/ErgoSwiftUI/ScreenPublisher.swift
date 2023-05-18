// Copyright © Fleuronic LLC. All rights reserved.

import Combine
import WorkflowUI

final class ScreenPublisher<Screen: WorkflowUI.Screen>: ObservableObject {
	@Published var screen: Screen

	init(screen: Screen) {
		self.screen = screen
	}
}
