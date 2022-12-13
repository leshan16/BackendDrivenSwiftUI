//
//  Component.swift
//  BackendDrivenSwiftUI
//
//  Created by Апестин Алексей Дмитриевич on 13.12.2022.
//

import CoreGraphics

/// Компонент для отображения
struct Component: Decodable {

	/// Тип
	let type: ViewType

	/// Идентификатор
	let id: Int

	/// Набор дополнительных полей
	let payload: Payload

	/// Вложенные компоненты
	let components: [Component]

	private enum CodingKeys: String, CodingKey {
		case type
		case id
		case actions
		case components
		case payload
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		type = try container.decode(ViewType.self, forKey: .type)
		id = try container.decode(Int.self, forKey: .id)
		components = try container.decodeIfPresent([Component].self, forKey: .components) ?? []

		switch type {
		case .vStack, .hStack, .zStack:
			payload = .stack(try container.decode(Payload.Stack.self, forKey: .payload))

		case .spacer:
			payload = .spacer(try container.decode(Payload.Spacer.self, forKey: .payload))

		case .text:
			payload = .text(try container.decode(Payload.Text.self, forKey: .payload))

		case .stepper:
			payload = .stepper(try container.decode(Payload.Stepper.self, forKey: .payload))

		case .image:
			payload = .image(try container.decode(Payload.Image.self, forKey: .payload))

		case .textField:
			payload = .textField(try container.decode(Payload.TextField.self, forKey: .payload))

		case .list:
			payload = .list(try container.decode(Payload.List.self, forKey: .payload))

		case .button:
			payload = .button(try container.decode(Payload.Button.self, forKey: .payload))

		case .navigation:
			payload = .navigation(try container.decode(Payload.Navigation.self, forKey: .payload))
		}
	}
}

extension Component {

	/// Тип компонента
	enum ViewType: String, Decodable {
		case vStack = "VStack"
		case hStack = "HStack"
		case zStack = "ZStack"
		case textField = "TextField"
		case spacer = "Spacer"
		case text = "Text"
		case stepper = "Stepper"
		case image = "Image"
		case button = "Button"
		case navigation = "Navigation"
		case list = "List"
	}

	/// Набор дополнительных полей
	enum Payload: Decodable {
		case stack(Stack)
		case spacer(Spacer)
		case text(Text)
		case stepper(Stepper)
		case image(Image)
		case textField(TextField)
		case list(List)
		case button(Button)
		case navigation(Navigation)
	}
}

extension Component.Payload {

	/// Дополнительные поля для стека
	struct Stack: Decodable {

		/// Интервал
		let spacing: CGFloat?

		/// Отступы
		let paddings: Paddings?
	}

	/// Дополнительные поля для заполнителя пространства между элементами
	struct Spacer: Decodable {

		/// Минимальный размер
		var minLength: Float?
	}

	/// Дополнительные поля для текста
	struct Text: Decodable {

		/// Текст
		var text: String

		/// Шрифт
		var font: FontStyle?

		/// Выравнивание текста
		var alignment: Alignment?
	}

	/// Дополнительные поля для степера
	struct Stepper: Decodable {

		/// Стартовое значение
		let startValue: Int?
	}

	/// Дополнительные поля для картинки
	struct Image: Decodable {

		/// Ссылка на скачивание
		var url: String

		/// Выравнивание
		var alignment: Alignment?

		/// Размер
		var size: Size?
	}

	/// Дополнительные поля для компонента ввода текста
	struct TextField: Decodable {

		/// Название иконки
		let iconName: String?

		/// Заполнитель
		let title: String

		/// Цвет фона
		let backgroundColor: String?
	}

	/// Дополнительные поля для панели навигации
	struct Navigation: Decodable {

		/// Заголовок
		let title: String

		/// Название левой иконки
		let leftIconName: String?

		/// Название правой иконки
		let rightIconName: String?
	}

	/// Дополнительные поля для таблицы
	struct List: Decodable {}

	/// Дополнительные поля для кнопки
	struct Button: Decodable {

		/// Название иконки
		var iconName: String
	}

	/// Отступы
	struct Paddings: Decodable {

		/// Отступ сверху
		let top: CGFloat?

		/// Отступ снизу
		let bottom: CGFloat?

		/// Отступ слева
		let leading: CGFloat?

		/// Отступ справа
		let trailing: CGFloat?
	}

	/// Размер
	struct Size: Decodable {

		/// Ширина
		let width: CGFloat

		/// Высота
		let height: CGFloat
	}
}

extension Component.Payload.Text {

	/// Настройки шрифта
	struct FontStyle: Decodable {

		/// Тип шрифта
		var name: FontKind

		/// Жирность шрифта
		var weight: WeightKind?

		/// Цвет шрифта
		var color: String?
	}

	/// Выравнивание текста
	enum Alignment: String, Decodable {
		case leading
		case trailing
		case center
	}
}

extension Component.Payload.Text.FontStyle {

	/// Тип шрифта
	enum FontKind: String, Decodable {
		case body
		case title
		case callout
		case caption
		case caption2
		case footnate
		case headline
		case largeTitle
		case subheadline
		case title2
		case title3
	}

	/// Жирность шрифта
	enum WeightKind: String, Decodable {
		case regular
		case medium
		case black
		case bold
		case heavy
		case light
		case semibold
		case thin
		case ultraLight
	}
}

extension Component.Payload.Image {

	/// Выравнивание картинки
	enum Alignment: String, Decodable {
		case top
		case bottom
		case leading
		case trailing
		case center
	}
}
