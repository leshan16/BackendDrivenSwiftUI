//
//  Core.SpacerView.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Отображения заполнителя пространства между элементами
	struct SpacerView: View {

		/// Модель
		let viewModel: Core.SpacerModel

		var body: some View {
			if let minLength = viewModel.minLength {
				Spacer(minLength: CGFloat(minLength))
			} else {
				Spacer()
			}
		}
	}
}

struct SpacerView_Previews: PreviewProvider {

	static var previews: some View {
		Core.SpacerView(viewModel: Core.SpacerModel(minLength: 10))
	}
}
