//
//  Core.Navigation.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Модель отображения панели навигации
	struct Navigation: ViewModel {

		/// Заголовок
		let title: String

		/// Название левой иконки
		var leftIconName: String?

		/// Название правой иконки
		var rightIconName: String?

		let id: UUID = UUID()
		var viewModels: [ViewModel]

		func makeView() -> AnyView {
			AnyView(NavigationComponent(component: self))
		}
	}
}
