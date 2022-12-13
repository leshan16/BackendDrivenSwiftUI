//
//  Core.TextModel.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Модель отображения текста
	struct TextModel: ViewModel {

		/// Текст
		let text: String

		/// Шрифт
		let font: Font

		/// Жирность шрифта
		let weight: Font.Weight

		/// Цвет шрифта
		let color: Color

		/// Выравнивание
		let alignment: TextAlignment

		let id: UUID = UUID()
		var viewModels: [ViewModel] = []

		func makeView() -> AnyView {
			AnyView(TextView(viewModel: self))
		}
	}
}
