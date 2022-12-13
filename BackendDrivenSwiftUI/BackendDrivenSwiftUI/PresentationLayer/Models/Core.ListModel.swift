//
//  Core.ListModel.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Модель отображения таблицы
	struct ListModel: ViewModel {
		
		let id: UUID = UUID()
		var viewModels: [ViewModel]

		func makeView() -> AnyView {
			AnyView(ListView(viewModel: self))
		}
	}
}
