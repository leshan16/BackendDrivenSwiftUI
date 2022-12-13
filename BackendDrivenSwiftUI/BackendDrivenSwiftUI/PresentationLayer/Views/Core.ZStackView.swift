//
//  Core.ZStackView.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Отображение z стека
	struct ZStackView: View {

		/// Модель
		let viewModel: Core.ZStackModel

		var body: some View {
			ZStack {
				ForEach(viewModel.viewModels, id: \.id) {
					$0.makeView()
				}
			}
			.padding(viewModel.paddings)
		}
	}
}

struct ZStackView_Previews: PreviewProvider {

	static var previews: some View {
		Core.ZStackView(viewModel: Core.ZStackModel(paddings: EdgeInsets(), viewModels: [Core.StepperModel(value: 0)]))
	}
}
