//
//  Core.NavigationControllerView.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Отображение панели навигации
	struct NavigationControllerView: View {

		/// Модель
		let viewModel: Core.NavigationModel

		var body: some View {
			NavigationView {
				List {
					ForEach(viewModel.viewModels, id: \.id) {
						$0.makeView()
					}.navigationBarTitle(viewModel.title, displayMode: .large)
						.navigationBarItems(leading: HStack {
							if let leftIconName = viewModel.leftIconName {
								Button {
									print("left action")
								} label: {
									Image(systemName: leftIconName)
								}
							}
						}, trailing: HStack {
							if let rightIconName = viewModel.rightIconName {
								Button {
									print("right action")
								} label: {
									Image(systemName: rightIconName)
								}
							}
						})
				}
			}
		}
	}
}

struct NavigationControllerView_Previews: PreviewProvider {

	static var previews: some View {
		Core.NavigationControllerView(
			viewModel: .init(
				title: "Title",
				rightIconName: "rectangle.3.offgrid.fill",
				viewModels: [
					Core.ButtonModel(iconName: "heart.cicle")
				]
			)
		)
	}
}
