import SwiftUI

@main
struct WineShopApp: App {
	var body: some Scene {
		WindowGroup {
			TabView {
				NavigationView {
					ProductsListView()
				}
				.tabItem {
					Label("Products", systemImage: "cart")
				}

				NavigationView {
					SubscriptionsListView()
				}
				.tabItem {
					Label("Subscriptions", systemImage: "shippingbox")
				}

				NavigationView {
					PurchasesHistoryView()
				}
				.tabItem {
					Label("History", systemImage: "clock")
				}
			}
		}
	}
}
