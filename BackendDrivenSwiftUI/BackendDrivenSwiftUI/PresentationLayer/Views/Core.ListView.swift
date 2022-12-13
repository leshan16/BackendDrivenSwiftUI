//
//  Core.ListView.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Отображение таблицы
	struct ListView: View {

		/// Модель
		let viewModel: ViewModel

		var body: some View {
			List(viewModel.viewModels, id: \.id) { item in
				item.makeView()
			}
		}
	}
}

struct ListView_Previews: PreviewProvider {

	static var previews: some View {
		Core.ListView(viewModel: Core.ListModel(viewModels: [
			Core.TextFieldModel(title: "title", viewModels: []),
			Core.TextFieldModel(title: "title 2", viewModels: []),
			Core.TextFieldModel(title: "title 3", viewModels: [])
		]))
	}
}
