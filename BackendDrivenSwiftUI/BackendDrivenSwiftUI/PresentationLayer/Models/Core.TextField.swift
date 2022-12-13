//
//  Core.TextField.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Модель отображения поля ввода текста
	struct TextField: ViewModel {

		/// Название иконки
		var iconName: String?

		/// Заполнитель
		var title: String

		/// Цвет фона
		var backgroundColor: String?

		let id: UUID = UUID()
		var viewModels: [ViewModel] = []

		func makeView() -> AnyView {
			AnyView(TextFieldView(viewModel: self))
		}
	}
}
