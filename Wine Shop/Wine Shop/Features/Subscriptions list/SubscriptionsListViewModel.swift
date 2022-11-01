import Combine

@MainActor
final class SubscriptionsListViewModel: ObservableObject {
	
	enum State {
		case loading
		case data(subscriptions: [Product])
		case empty
		case error(error: Error)
	}
	
	@Published private(set) var state: State = .loading
	
	private let store: Store
	
	init(store: Store = .shared) {
		self.store = store
	}
	
	func fetchSubscriptions() async {
		state = .loading
		
		do {
			let subscriptions = try await store.fetchAllSubscriptions()
			state = subscriptions.isEmpty ? .empty : .data(subscriptions: subscriptions)
		} catch {
			state = .error(error: error)
		}
	}
	
	func startSubscriptionFlow(_ subscription: Product) async {
		do {
			try await store.buy(product: subscription)
		} catch {
			print(error)
		}
	}
}
