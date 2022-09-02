final actor PurchasesStorage {

	private var purchases: [String: Int] = [:]

	func fetchPurchasedProductsIDs() -> [String] {
		purchases
			.filter { $0.value > 0 }
			.map { $0.key }
	}

	func increment(quantity: Int = 1, for product: Product) {
		if let purchasedQuantity = purchases[product.id] {
			purchases[product.id] = purchasedQuantity + quantity
		} else {
			purchases[product.id] = quantity
		}
	}
}
