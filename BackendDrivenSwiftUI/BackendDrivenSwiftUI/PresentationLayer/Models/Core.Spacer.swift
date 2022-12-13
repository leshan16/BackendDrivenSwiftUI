//
//  Core.Spacer.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Модель отображения заполнителя пространства между элементами
	struct Spacer: ViewModel {

		/// Минимальный размер
		let minLength: Float?

		let id: UUID = UUID()
		var viewModels: [ViewModel] = []

		func makeView() -> AnyView {
			AnyView(SpacerView(viewModel: self))
		}
	}
}
