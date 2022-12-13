//
//  Core.ImageView.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Core {

	/// Отображение картинки
	struct ImageView: View {

		/// Модель
		let viewModel: Core.ImageModel

		var body: some View {
			AsyncImage(url: viewModel.url) { loadedImage in
				loadedImage
					.resizable()
					.scaledToFit()
			} placeholder: {
				ProgressView()
			}
			.frame(
				width: viewModel.size.width,
				height: viewModel.size.height,
				alignment: viewModel.alignment
			)
			.cornerRadius(viewModel.size.width / 2)
		}
	}
}

struct ImageView_Previews: PreviewProvider {

	static var previews: some View {
		Core.ImageView(
			viewModel: Core.ImageModel(
				url: URL(string: "https://via.placeholder.com/150")!,
				alignment: .center,
				size: .init(width: 100, height: 100)
			)
		)
	}
}
