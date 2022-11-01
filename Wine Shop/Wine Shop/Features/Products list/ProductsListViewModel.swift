import Foundation

@MainActor
final class ProductsListViewModel: ObservableObject {
	
	enum State {
		case loading
		case empty
		case data(products: [Product])
		case error(error: Error)
	}
	
	@Published
	private(set) var state: State = .loading
	
	private let store: Store
	
	init(store: Store = .shared) {
		self.store = store
	}
	
	func fetchAllProducts() async {
		state = .loading
		
		do {
			let products = try await store.fetchAllProducts()
			state = products.isEmpty ? .empty : .data(products: products)
		} catch {
			state = .error(error: error)
		}
	}
}
