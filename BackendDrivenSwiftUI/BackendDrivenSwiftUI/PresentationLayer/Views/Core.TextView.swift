//
//  Core.TextView.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Отображение текста
	struct TextView: View {

		/// Модель
		let viewModel: Core.TextModel

		var body: some View {
			Text(viewModel.text)
				.font(viewModel.font)
				.fontWeight(viewModel.weight)
				.tint(viewModel.color)
				.multilineTextAlignment(viewModel.alignment)
		}
	}
}

struct TextView_Previews: PreviewProvider {

	static var previews: some View {
		Core.TextView(viewModel: .init(
			text: "testable text",
			font: .title3,
			weight: .regular,
			color: .red,
			alignment: .leading
		))
	}
}
