import Combine

@MainActor
final class PurchasesHistoryViewModel: ObservableObject {
	
	enum State {
		case loading
		case data([Purchase])
		case empty
	}
	
	@Published
	private(set) var state: State = .loading
	
	func loadPurchases() async {
		let purchaseHistory = await Store.shared.fetchPurchasesHistory()
		
		if purchaseHistory.isEmpty {
			state = .empty
		} else {
			state = .data(purchaseHistory)
		}
	}
}
