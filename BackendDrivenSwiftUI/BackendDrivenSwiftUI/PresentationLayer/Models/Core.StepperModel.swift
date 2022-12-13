//
//  Core.StepperModel.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Модель отображения степера
	struct StepperModel: ViewModel {

		let id: UUID = UUID()
		var viewModels: [ViewModel] = []
		private(set) var value: Int = 0

		func makeView() -> AnyView {
			AnyView(StepperView(viewModel: self))
		}

		init(value: Int?) {
			self.value = value ?? 0
		}

		/// Уменьшить значение
		mutating func removeItem() {
			guard value > 0 else { return }
			value -= 1
		}

		/// Увеличить значение
		mutating func addItem() {
			value += 1
		}
	}
}
