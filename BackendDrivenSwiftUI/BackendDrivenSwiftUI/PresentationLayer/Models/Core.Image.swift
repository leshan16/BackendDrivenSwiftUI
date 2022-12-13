//
//  Core.Image.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Модель отображения картинки
	struct Image: ViewModel {

		/// Ссылка на скачивание картинки
		let url: URL

		/// Выравнивание
		let alignment: Alignment

		/// Размер картинки
		let size: CGSize

		let id: UUID = UUID()
		var viewModels: [ViewModel] = []

		func makeView() -> AnyView {
			AnyView(ImageView(viewModel: self))
		}
	}
}
