//
//  ViewModel.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

/// Интерфейс модели компонента UI
protocol ViewModel {

	/// Идентификатор
	var id: UUID { get }

	/// Вложенные модели
	var viewModels: [ViewModel] { get }

	/// Сформировать компонент UI
	/// - Returns: Компонент UI
	func makeView() -> AnyView
}
