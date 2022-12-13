//
//  MainPresenter.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

/// Интерфейс презентера главного экрана
protocol MainPresenterProtocol {

	/// Получить модели компонентов UI
	/// - Returns: Модели
	func getViewModels() async throws -> [ViewModel]
}


/// Презентер главного экрана
struct MainPresenter: MainPresenterProtocol {

	/// Сервис получения данных для отображения
	var databaseService: DatabaseServiceProtocol = DatabaseService()

	func getViewModels() async throws -> [ViewModel] {
		let components = try await databaseService.getComponents()
		return makeViewModels(from: components)
	}

	private func makeViewModels(from models: [Component]) -> [ViewModel] {
		let mapped: [ViewModel] = models.compactMap {
			switch ($0.type, $0.payload) {
			case (.vStack, .stack(let parameters)):
				return Core.VStackModel(
					spacing: parameters.spacing,
					paddings: EdgeInsets(paddings: parameters.paddings),
					viewModels: makeViewModels(from: $0.components)
				)

			case (.hStack, .stack(let parameters)):
				return Core.HStackModel(
					spacing: parameters.spacing,
					paddings: EdgeInsets(paddings: parameters.paddings),
					viewModels: makeViewModels(from: $0.components)
				)

			case (.zStack, .stack(let parameters)):
				return Core.ZStackModel(
					paddings: EdgeInsets(paddings: parameters.paddings),
					viewModels: makeViewModels(from: $0.components)
				)

			case (.button, .button(let parameters)):
				return Core.ButtonModel(iconName: parameters.iconName)

			case (.stepper, .stepper(let parameters)):
				return Core.StepperModel(value: parameters.startValue)

			case (.image, .image(let parameters)):
				guard let url = URL(string: parameters.url) else {
					return nil
				}

				let size = CGSize(
					width: CGFloat(parameters.size?.width ?? 24),
					height: CGFloat(parameters.size?.height ?? 24)
				)
				return Core.ImageModel(
					url: url,
					alignment: Alignment.fromString(parameters.alignment?.rawValue ?? ""),
					size: size
				)

			case (.navigation, .navigation(let parameters)):
				return Core.NavigationModel(
					title: parameters.title,
					leftIconName: parameters.leftIconName ?? "",
					rightIconName:  parameters.rightIconName ?? "",
					viewModels: makeViewModels(from: $0.components)
				)

			case (.list, .list):
				return Core.ListModel(viewModels: makeViewModels(from: $0.components))

			case (.spacer, .spacer(let parameters)):
				return Core.SpacerModel(minLength: parameters.minLength)

			case (.textField, .textField(let parameters)):
				return Core.TextFieldModel(iconName: parameters.iconName,
										   title: parameters.title,
										   backgroundColor: parameters.backgroundColor)

			case (.text, .text(let parameters)):
				return Core.TextModel(
					text: parameters.text,
					font: Font.fromString(parameters.font?.name.rawValue ?? ""),
					weight: Font.Weight.fromString(parameters.font?.weight?.rawValue ?? ""),
					color: Color.fromString(parameters.font?.color ?? ""),
					alignment: TextAlignment.fromString(parameters.alignment?.rawValue ?? "")
				)

			default:
				return nil
			}
		}

		return mapped
	}
}

private extension EdgeInsets {

	init(paddings: Component.Payload.Paddings?) {
		self.init(top: paddings?.top ?? 0,
				  leading: paddings?.leading ?? 0,
				  bottom: paddings?.bottom ?? 0,
				  trailing: paddings?.trailing ?? 0)
	}
}
