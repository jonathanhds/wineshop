import StoreKit

final class Store {

	static let shared = Store()

	private init() {}

	func fetchAllProducts() async throws -> [Product] {
		let products = try await StoreKit.Product.products(for: ALL_PRODUCTS_IDS)
		return products.map { product in
			let metadata = findMetadata(for: product)
			return Product(id: product.id,
						   name: product.displayName,
						   description: metadata["description"],
						   thumbnailImage: metadata["thumbnailImage"],
						   price: product.displayPrice)
		}
	}

	private func findMetadata(for product: StoreKit.Product) -> [String: String] {
		switch product.id {
		case "wine.cabernet-sauvignon":
			return [
				"description": "Cabernet Sauvignon is a noble and intensely flavored dry red wine. It is considered the king of wines around the world because of its ability to age. Originally from France, Cabernet is one of the most widely planted red wine grapes internationally."
			]
		default:
			return [:]
		}
	}
}
