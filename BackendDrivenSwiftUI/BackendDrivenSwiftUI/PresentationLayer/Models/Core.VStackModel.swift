//
//  Core.VStackModel.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import CoreGraphics
import SwiftUI

extension Core {

	/// Модель отображения вертикального стека
	struct VStackModel: ViewModel {

		/// Интервал
		let spacing: CGFloat?

		/// Отступы
		var paddings: EdgeInsets

		let id: UUID = UUID()
		var viewModels: [ViewModel]

		func makeView() -> AnyView {
			AnyView(VStackView(viewModel: self))
		}
	}
}
