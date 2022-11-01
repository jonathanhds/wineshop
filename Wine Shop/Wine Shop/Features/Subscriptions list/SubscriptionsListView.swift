import SwiftUI

struct SubscriptionsListView: View {
	
	@StateObject
	private var viewModel = SubscriptionsListViewModel()
	
	var body: some View {
		Group {
			switch viewModel.state {
			case .loading:
				LoadingView()
			case .error(let error):
				Text(error.localizedDescription)
			case .empty:
				Text("No subscriptions found!")
			case .data(let subscriptions):
				List(subscriptions) { subscription in
					SubscriptionRowView(subscription: subscription)
						.onTapGesture {
							Task {
								await viewModel.startSubscriptionFlow(subscription)
							}
						}
						.listRowSeparator(.hidden)
				}
				.listStyle(.inset)
			}
		}
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
