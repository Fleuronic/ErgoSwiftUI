// Copyright © Fleuronic LLC. All rights reserved.

import UIKit
import SwiftUI
import WorkflowUI

class BodyViewController<View: BodyProvider>: ScreenViewController<View.Screen> {
	private let context: ScreenObservingView<View>.Context
	private let hostingController: UIHostingController<ScreenObservingView<View>>

	// MARK: UIViewController
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		hostingController.view.frame = view.bounds
	}

	// MARK: ScreenViewController
	required init(screen: View.Screen, environment: ViewEnvironment) {
		context = .init(screen: screen)
		hostingController = .init(
			rootView: .init(
				content: .init(),
				context: context
			)
		)

		super.init(screen: screen, environment: environment)

		addChild(hostingController)
		view.addSubview(hostingController.view)
		hostingController.didMove(toParent: self)
	}

	override func screenDidChange(from previousScreen: View.Screen, previousEnvironment: ViewEnvironment) {
		super.screenDidChange(from: previousScreen, previousEnvironment: previousEnvironment)
		context.screen = screen
	}
}
