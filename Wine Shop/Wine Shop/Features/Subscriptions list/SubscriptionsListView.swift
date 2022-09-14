import SwiftUI

struct SubscriptionsListView: View {

	@StateObject
	private var viewModel = SubscriptionsListViewModel()

    var body: some View {
        Text("Hello, World!")
			.navigationTitle("Subscriptions")
			.task {
				await viewModel.fetchSubscriptions()
			}
    }
}

struct SubscriptionsListView_Previews: PreviewProvider {
    static var previews: some View {
		TabView {
			NavigationView {
				SubscriptionsListView()
			}
			.tabItem {
				Label("Subscriptions", systemImage: "shippingbox")
			}
		}
    }
}
