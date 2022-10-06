import StoreKit

enum StoreError: Error {
	case productNotFound
}

final class Store {

	static let shared = Store()

	private let storage = PurchasesStorage()

	private var storeKitTaskHandle: Task<Void, Error>?

	private init() {
		storeKitTaskHandle = listenForStoreKitUpdates()
	}

	deinit {
		storeKitTaskHandle?.cancel()
		storeKitTaskHandle = nil
	}

	func fetchAllProducts() async throws -> [Product] {
		try await fetchProducts(ids: ALL_PRODUCTS_IDS)
	}

	func fetchAllSubscriptions() async throws -> [Product] {
		try await fetchProducts(ids: ALL_SUBSCRIPTIONS_IDS)
	}

	private func fetchProducts(ids: Set<String>) async throws -> [Product] {
		let products = try await StoreKit.Product.products(for: ids)
		return products.map { product in
			let metadata = findMetadata(for: product)
			return Product(id: product.id,
						   name: product.displayName,
						   description: metadata["description"],
						   thumbnailImage: metadata["thumbnailImage"],
						   price: product.displayPrice)
		}
	}

	func buy(product: Product, quantity: Int? = nil) async throws {
		let storeKitProducts = try await StoreKit.Product.products(for: [product.id])
		guard let storeKitProduct = storeKitProducts.first else { throw StoreError.productNotFound }

		var options: Set<StoreKit.Product.PurchaseOption> = []
		if let quantity = quantity {
			options.insert(.quantity(quantity))
		}
		let purchaseResult = try await storeKitProduct.purchase(options: options)

		switch purchaseResult {
		case .success(let verificationResult):
			switch verificationResult {
			case .verified(let transaction):
				await transaction.finish()
				await storage.persistPurchase(product: product, quantity: quantity ?? 1)
			case .unverified:
				break
			}
		case .pending:
			break
		case .userCancelled:
			break
		@unknown default:
			break
		}
	}

	func fetchPurchasesHistory() async -> [Purchase]  {
		await storage.fetchPurchasesHistory()
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

	private func listenForStoreKitUpdates() -> Task<Void, Error> {
		Task.detached {
			for await result in Transaction.updates {
				switch result {
				case .verified(let transaction):
					print("Transaction verified in listener")
					await transaction.finish()
					// Update the user's purchases...
				case .unverified:
					print("Transaction unverified")
				}
			}
		}
	}
}
