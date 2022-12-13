//
//  Font+Extension.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import SwiftUI

extension Font {

	/// Получить шрифт по названию
	/// - Parameter string: Название
	/// - Returns: Шрифт
	static func fromString(_ string: String) -> Font {
		switch string {
		case "body":
			return .body

		case "title":
			return .title

		case "callout":
			return .callout

		case "caption":
			return .caption

		case "caption2":
			return .caption2

		case "footnate":
			return .footnote

		case "headline":
			return .headline

		case "largeTitle":
			return .largeTitle

		case "subheadline":
			return .subheadline

		case "title2":
			return .title2

		case "title3":
			return .title3
			
		default:
			return .body
		}
	}
}
