//
//  Core.ZStackModel.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import CoreGraphics
import SwiftUI

extension Core {

	/// Модель отображения z стека
	struct ZStackModel: ViewModel {

		/// Отступы
		var paddings: EdgeInsets

		let id: UUID = UUID()
		var viewModels: [ViewModel]

		func makeView() -> AnyView {
			AnyView(ZStackView(viewModel: self))
		}
	}
}
