//
//  MainView.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

/// Главный экран
struct MainView: View {

	/// Презентер экрана
	var presenter: MainPresenterProtocol = MainPresenter()

	@State private var viewModels: [ViewModel] = []

	var body: some View {
		VStack {
			ForEach(viewModels, id: \.id) {
				$0.makeView()
			}
		}
		.onAppear {
			Task {
				viewModels = (try? await presenter.getViewModels()) ?? []
			}
		}
	}
}

struct MainView_Previews: PreviewProvider {

	static var previews: some View {
		MainView()
	}
}
