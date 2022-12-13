//
//  DatabaseService.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

/// Интерфейс сервиса получения данных для отображения
protocol DatabaseServiceProtocol {

	/// Получить компоненты для отображения
	/// - Returns: Компоненты
	func getComponents() async throws -> [Component]
}

/// Сервис получения данных для отображения
struct DatabaseService: DatabaseServiceProtocol {

	func getComponents() async throws -> [Component] {
		// TODO: - Реализовать получение данных из Firebase или локальных json
		return []
	}
}
