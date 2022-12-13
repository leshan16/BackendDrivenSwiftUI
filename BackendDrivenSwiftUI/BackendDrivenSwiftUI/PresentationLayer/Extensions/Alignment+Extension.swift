//
//  Alignment+Extension.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Alignment {

	/// Получить выравнивание контента по названию
	/// - Parameter string: Название
	/// - Returns: Выравнивание
	static func fromString(_ string: String) -> Alignment {
		switch string {
		case "top":
			return .top

		case "bottom":
			return .bottom

		case "leading":
			return .leading

		case "trailing":
			return .trailing

		case "center":
			return .center
			
		default:
			return .center
		}
	}

}
