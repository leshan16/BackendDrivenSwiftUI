//
//  Font.Weight+Extension.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Font.Weight {

	/// Получить жирность шрифта по названию
	/// - Parameter string: Название
	/// - Returns: Жирность шрифта
	static func fromString(_ string: String) -> Font.Weight {
		switch string {
		case "regular":
			return .regular

		case "medium":
			return .medium

		case "black":
			return .black

		case "bold":
			return .bold

		case "heavy":
			return .heavy

		case "light":
			return .light

		case "semibold":
			return .semibold

		case "thin":
			return .thin

		case "ultraLight":
			return .ultraLight
			
		default:
			return .regular
		}
	}
}
