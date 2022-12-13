//
//  Core.VStackView.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Отображение вертикального стека
	struct VStackView: View {

		/// Модель
		let viewModel: Core.VStackModel
		
		var body: some View {
			VStack(spacing: viewModel.spacing) {
				ForEach(viewModel.viewModels, id: \.id) {
					$0.makeView()
				}
			}
			.padding(viewModel.paddings)
		}
	}
}

struct VStackView_Previews: PreviewProvider {

	static var previews: some View {
		Core.VStackView(viewModel: Core.VStackModel(spacing: 10, paddings: EdgeInsets(), viewModels: [Core.StepperModel(value: 0)]))
	}
}
