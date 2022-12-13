//
//  Core.StepperView.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Отображение степера
	struct StepperView: View {

		/// Модель
		@State var viewModel: Core.StepperModel

		var body: some View {
			HStack(alignment: .center, spacing: 10) {
				changeButton(text: "-") {
					viewModel.removeItem()
				}
				Text("\(viewModel.value)").font(.system(size: 16))
				changeButton(text: "+") {
					viewModel.addItem()
				}
			}
		}

		private func changeButton(text: String, action: (() -> Void)?) -> some View {
			Button(action: {
				action?()
			}) {
				Text(text)
					.font(.system(size: 11))
					.tint(.black)
					.padding(.init(
						top: 4,
						leading: 8,
						bottom: 4,
						trailing: 8
					))
					.overlay(
						RoundedRectangle(cornerRadius: 2)
							.stroke(Color(UIColor.lightGray.withAlphaComponent(0.5)), lineWidth: 1)
					)
			}
		}
	}
}

struct StepperView_Previews: PreviewProvider {

	static var previews: some View {
		Core.StepperView(viewModel: Core.StepperModel(value: nil))
	}
}
