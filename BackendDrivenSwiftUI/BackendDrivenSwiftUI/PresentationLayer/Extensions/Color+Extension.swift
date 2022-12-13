//
//  Color+Extension.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Color {

	/// Получить цвет из названия
	/// - Parameter string: Название цвета
	/// - Returns: Цвет
	static func fromString(_ string: String) -> Color {
		switch string {
		case "green":
			return Color.green

		case "white":
			return Color.white

		case "black":
			return Color.black

		case "red":
			return Color.red

		case "gray":
			return Color.gray

		case "blue":
			return Color.blue

		default:
			return Color.accentColor
		}
	}
}
