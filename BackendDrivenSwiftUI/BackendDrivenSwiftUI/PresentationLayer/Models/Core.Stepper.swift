//
//  Core.Stepper.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Модель отображения степера
	struct Stepper: ViewModel {

		let id: UUID = UUID()
		var viewModels: [ViewModel] = []
		private var value: Int = 0

		func makeView() -> AnyView {
			AnyView(StepperView(component: self))
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
