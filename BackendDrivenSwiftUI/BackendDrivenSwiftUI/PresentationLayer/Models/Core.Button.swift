//
//  Core.Button.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Модель отображения кнопки
	struct Button: ViewModel {

		/// Название иконки
		let iconName: String

		let id: UUID = UUID()

		var viewModels: [ViewModel] = []

		func makeView() -> AnyView {
			AnyView(ButtonView(viewModel: self))
		}
	}
}
