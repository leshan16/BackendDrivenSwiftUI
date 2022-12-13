//
//  Core.HStackView.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Отображение горизонтального стека
	struct HStackView: View {

		/// Модель
		let viewModel: Core.HStackModel

		var body: some View {
			HStack(spacing: viewModel.spacing) {
				ForEach(viewModel.viewModels, id: \.id) {
					$0.makeView()
				}
			}
			.padding(viewModel.paddings)
		}
	}
}

struct HStackView_Previews: PreviewProvider {

	static var previews: some View {
		Core.HStackView(viewModel: Core.HStackModel(spacing: 10, paddings: EdgeInsets(), viewModels: [Core.StepperModel(value: 0)]))
	}
}
