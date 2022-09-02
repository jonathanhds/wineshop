import Foundation

final actor PurchasesStorage {

	private var purchaseHistory: [Purchase] = []

	func persistPurchase(product: Product, quantity: Int) {
		purchaseHistory.append(Purchase(
			product: product,
			quantity: quantity,
			date: Date()
		))
	}

	func fetchPurchasesHistory() -> [Purchase] {
		purchaseHistory
	}
}
