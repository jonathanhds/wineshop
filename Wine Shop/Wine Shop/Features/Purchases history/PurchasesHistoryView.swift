import SwiftUI

struct PurchasesHistoryView: View {

	@StateObject
	private var viewModel = PurchasesHistoryViewModel()

	var body: some View {
		Group {
			switch viewModel.state {
			case .loading:
				ProgressView("Loading...")
			case .empty:
				Text("Empty")
			case .data(let purchasesHistory):
				List(purchasesHistory) { row in
					PurchaseRowView(purchase: row)
				}
			}
		}
		.navigationTitle("History")
		.task {
			await viewModel.loadPurchases()
		}
	}
}

struct PurchasesHistoryView_Previews: PreviewProvider {
	static var previews: some View {
		TabView {
			NavigationView {
				PurchasesHistoryView()
			}
			.tabItem {
				Label("History", systemImage: "clock")
			}
		}
	}
}
