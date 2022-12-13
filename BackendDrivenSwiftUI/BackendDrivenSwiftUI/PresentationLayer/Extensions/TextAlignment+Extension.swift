//
//  TextAlignment+Extension.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension TextAlignment {

	/// Получить выравнивание текста по названию
	/// - Parameter string: Название
	/// - Returns: Выравнивание
	static func fromString(_ string: String) -> TextAlignment {
		switch string {
		case "leading":
			return .leading

		case "trailing":
			return .trailing

		case "center":
			return .center

		default:
			return .leading
		}
	}
}
