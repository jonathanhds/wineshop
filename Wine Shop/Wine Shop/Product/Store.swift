import StoreKit

final class Store {

	func fetchAllProducts() async throws -> [Product] {
		let products = try await StoreKit.Product.products(for: ALL_PRODUCTS_IDS)
		return products.map { product in
			Product(id: product.id,
					name: product.displayName,
					description: product.description,
					price: product.price)
		}
	}
}
