//
//  Core.TextFieldView.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Отображение поля ввода
	struct TextFieldView: View {

		@State private var text: String = ""

		/// Модель
		let viewModel: Core.TextFieldModel

		var body: some View {
			HStack {
				if let iconName = viewModel.iconName {
					Image(systemName: iconName)
						.foregroundColor(.gray)
						.padding(10)
				}
				TextField(viewModel.title, text: $text)
					.frame(height: 40)
			}
			.background(Color.fromString(viewModel.backgroundColor ?? "").opacity(0.15))
			.cornerRadius(15)
		}
	}
}

struct TextFieldView_Previews: PreviewProvider {

	static var previews: some View {
		Core.TextFieldView(viewModel: Core.TextFieldModel(iconName: "magnifyingglass",
												title: "Search",
												backgroundColor: "gray"))
			.previewLayout(.sizeThatFits)
			.padding()
	}
}
