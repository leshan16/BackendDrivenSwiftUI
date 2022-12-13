//
//  Core.ButtonView.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Отображение кнопки
	struct ButtonView: View {

		/// Модель
		let viewModel: Core.ButtonModel

		@State private var selected: Bool = false

		var body: some View {
			Button {
				selected.toggle()
			} label: {
				Image(systemName: viewModel.iconName)
					.font(.caption2)
					.symbolRenderingMode(selected ? .multicolor : .hierarchical)
			}
			.padding(5)
			.cornerRadius(2)
			.border(.gray, width: 0.5)
		}
	}
}

struct ButtonView_Previews: PreviewProvider {

	static var previews: some View {
		Core.ButtonView(
			viewModel: Core.ButtonModel(iconName: "heart.fill")
		)
	}
}
