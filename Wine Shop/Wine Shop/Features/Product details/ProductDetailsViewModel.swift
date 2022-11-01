final class ProductDetailsViewModel {
	
	private let product: Product
	
	var description: String? {
		product.description
	}
	
	var thumbnailImage: String? {
		product.thumbnailImage
	}
	
	var name: String {
		product.name
	}
	
	var price: String {
		product.price
	}
	
	init(product: Product) {
		self.product = product
	}
	
	func buy() async {
		do {
			try await Store.shared.buy(product: product)
		} catch {
			print(error)
		}
	}
}
