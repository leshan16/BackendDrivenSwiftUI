//
//  StartScreenView.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

/// Стартовый экран
struct StartScreenView: View {

	@State private var isLoading: Bool = false

	var body: some View {
		VStack {
			Image("intro-illustration")
				.resizable()
				.scaledToFit()
				.padding(50)
				.shadow(color: .white.opacity(0.3), radius: 10, x: 0, y: 0)
			Text("Taste that best,\nIt's on time")
				.font(.largeTitle)
				.fontWeight(.black)
				.multilineTextAlignment(.center)
				.padding(.bottom, 10)
			Text("Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt")
				.font(.callout)
				.fontWeight(.thin)
				.multilineTextAlignment(.center)
				.padding(.horizontal, 50)
			Spacer()

			Button {
				isLoading.toggle()
			} label: {
				Text("Show menu")
					.fontWeight(.semibold)
					.frame(width: 150, height: 30)
			}
			.buttonStyle(.borderedProminent)
			.tint(Color(UIColor.systemRed))
			.padding(.horizontal, 120)
			.fullScreenCover(
				isPresented: $isLoading,
				content: MainView.init
			)

			Spacer()
		}
	}
}

struct StartScreenView_Previews: PreviewProvider {

	static var previews: some View {
		StartScreenView()
	}
}
